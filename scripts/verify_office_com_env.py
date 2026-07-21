from __future__ import annotations

import contextlib
from dataclasses import dataclass

import pythoncom
import win32com.client


@dataclass(frozen=True)
class OfficeApp:
    name: str
    prog_id: str
    version_attr: str = "Version"
    can_hide: bool = True


APPS = (
    OfficeApp("Word", "Word.Application"),
    OfficeApp("Excel", "Excel.Application"),
    OfficeApp("PowerPoint", "PowerPoint.Application", can_hide=False),
)


def verify_app(app: OfficeApp) -> str:
    instance = None
    try:
        instance = win32com.client.DispatchEx(app.prog_id)
        if app.can_hide:
            instance.Visible = False
        version = getattr(instance, app.version_attr, "unknown")
        return f"{app.name}: OK ({app.prog_id}, version {version})"
    finally:
        if instance is not None:
            with contextlib.suppress(Exception):
                instance.Quit()


def main() -> None:
    pythoncom.CoInitialize()
    try:
        for app in APPS:
            print(verify_app(app))
    finally:
        pythoncom.CoUninitialize()

    print("Microsoft Office COM automation OK")


if __name__ == "__main__":
    main()
