"""Convert Markdown replies to plain notification text."""

from html.parser import HTMLParser


class _HtmlText(HTMLParser):
    """Extract visible text from HTML fragments."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.parts = []
        self.hidden = None

    def handle_starttag(self, tag, attrs):
        if tag in {"script", "style"}:
            self.hidden = tag
        elif tag in {"br", "hr", "p", "div", "li", "tr", "pre", "blockquote"}:
            self.parts.append("\n")
        elif tag == "img":
            self.parts.append(dict(attrs).get("alt") or "")

    def handle_endtag(self, tag):
        if tag == self.hidden:
            self.hidden = None
        elif tag in {"p", "div", "li", "tr", "pre", "blockquote"}:
            self.parts.append("\n")

    def handle_data(self, data):
        if not self.hidden:
            self.parts.append(data)


def markdown_text(value: str) -> str:
    """Render Markdown as text while preserving code literals."""
    import mistune
    from mistune.util import unescape

    parser = mistune.create_markdown(
        renderer="ast", plugins=["strikethrough", "table", "task_lists"]
    )
    html = _HtmlText()

    def render(token):
        kind = token["type"]
        if kind in {"inline_html", "block_html"}:
            html.parts.clear()
            html.feed(token["raw"])
            return "".join(html.parts)
        if kind == "text":
            return "" if html.hidden else unescape(token["raw"])
        if kind in {"codespan", "block_code"}:
            if html.hidden:
                return ""
            return token["raw"] + ("\n" if kind == "block_code" else "")
        if kind in {"softbreak", "linebreak", "thematic_break"}:
            return "" if html.hidden else "\n"
        children = token.get("children", [])
        if kind == "list":
            items = []
            attrs = token.get("attrs", {})
            for number, item in enumerate(children, attrs.get("start", 1)):
                if item["type"] == "task_list_item":
                    prefix = "☑ " if item["attrs"]["checked"] else "☐ "
                else:
                    prefix = f"{number}. " if attrs.get("ordered") else "• "
                body = render(item).strip("\n")
                items.append(prefix + body.replace("\n", "\n  "))
            return "\n".join(items) + "\n\n"
        if kind in {"table_head", "table_row"}:
            return "\t".join(render(child) for child in children) + "\n"
        text = "".join(render(child) for child in children)
        if kind in {"paragraph", "heading", "block_quote"}:
            return text.rstrip("\n") + "\n\n"
        if kind == "block_text":
            return text + "\n"
        return text

    return "".join(render(token) for token in parser(value)).strip("\n")
