"""Format and send notification cards through a Feishu webhook."""

import json
from urllib.error import HTTPError, URLError
from urllib.parse import quote
from urllib.request import Request, urlopen

from . import DeliveryError, Notification


REPLY_MAX_CHARS = 600
REPLY_MAX_LINES = 12


def _single_line(value: str, limit: int) -> str:
    text = " ".join(value.split())
    return text if len(text) <= limit else text[: limit - 1] + "…"


def _reply_preview(notification: Notification) -> str:
    lines = notification.text.splitlines()
    text = "\n".join(lines)
    if len(text) <= REPLY_MAX_CHARS and len(lines) <= REPLY_MAX_LINES:
        return text

    marker = "\n…（已截断）"
    preview = "\n".join(lines[: REPLY_MAX_LINES - 1])
    return preview[: REPLY_MAX_CHARS - len(marker)].rstrip() + marker


def _row(label: str, value: str) -> dict:
    return {
        "tag": "column_set",
        "flex_mode": "none",
        "columns": [
            {
                "tag": "column",
                "width": "weighted",
                "weight": 1,
                "elements": [{"tag": "markdown", "content": f"**{label}**"}],
            },
            {
                "tag": "column",
                "width": "weighted",
                "weight": 4,
                "elements": [
                    {"tag": "div", "text": {"tag": "plain_text", "content": value}}
                ],
            },
        ],
    }


def make_message(notification: Notification) -> dict:
    workspace = _single_line(notification.workspace, 100)
    title = _single_line(notification.title, 200)
    elements = [_row("工作区", workspace), _row("会话", title)]
    preview = _reply_preview(notification)
    if preview:
        elements.append(
            {"tag": "div", "text": {"tag": "plain_text", "content": preview}}
        )
    if notification.url:
        elements.append(
            {
                "tag": "div",
                "text": {
                    "tag": "plain_text",
                    "content": "打开会话查看完整回复"
                    if preview
                    else "打开会话查看回复",
                    "text_size": "notation",
                    "text_color": "grey",
                },
            }
        )

    card = {
        "schema": "2.0",
        "config": {"wide_screen_mode": True},
        "header": {
            "template": "blue",
            "title": {
                "tag": "plain_text",
                "content": f"{notification.source} · 已回复",
            },
        },
        "body": {
            "padding": "12px",
            "vertical_spacing": "16px",
            "elements": elements,
        },
    }
    if notification.url:
        url = notification.url
        if url.startswith("vscode:"):
            url = "https://vscode.dev/redirect?url=" + quote(url, safe="")
        card["card_link"] = {"url": url}
    return {"msg_type": "interactive", "card": card}


def send(notification: Notification, webhook_url: str) -> None:
    request = Request(
        webhook_url,
        data=json.dumps(make_message(notification), ensure_ascii=False).encode("utf-8"),
        headers={"Content-Type": "application/json; charset=utf-8"},
        method="POST",
    )
    try:
        with urlopen(request, timeout=10) as response:
            result = json.load(response)
    except HTTPError as error:
        raise DeliveryError(f"HTTP {error.code}") from None
    except URLError as error:
        raise DeliveryError(f"Network error: {type(error.reason).__name__}") from None
    code = result["code"]
    if type(code) is not int:
        code = None
    if code != 0:
        raise DeliveryError(f"Feishu API code={code}")
