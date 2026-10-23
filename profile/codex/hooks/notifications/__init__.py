"""Shared notification data and delivery errors."""

from dataclasses import dataclass


class DeliveryError(RuntimeError):
    """A delivery failure whose message is safe to log."""


@dataclass(frozen=True)
class Notification:
    source: str
    session_id: str
    turn_id: str | None
    workspace: str
    title: str
    text: str
    url: str | None
