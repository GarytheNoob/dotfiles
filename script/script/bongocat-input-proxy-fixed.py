#!/bin/python
import subprocess
from pynput import keyboard, mouse

XDOTOOL_GETWINDOWID = "xdotool search --name ^BongoCat$"
BongoWindow = None
modifier_keys = {
    keyboard.Key.alt,
    keyboard.Key.alt_l,
    keyboard.Key.alt_r,
    keyboard.Key.ctrl,
    keyboard.Key.ctrl_l,
    keyboard.Key.ctrl_r,
    keyboard.Key.shift,
    keyboard.Key.shift_l,
    keyboard.Key.shift_r,
    keyboard.Key.cmd,
    keyboard.Key.cmd_l,
    keyboard.Key.cmd_r,
    keyboard.Key.menu,
}
active_modifiers = set()


def _refresh_window_id():
    global BongoWindow
    window_ids = subprocess.getoutput(XDOTOOL_GETWINDOWID).splitlines()
    if window_ids:
        BongoWindow = window_ids[0]
    return BongoWindow


def _key_to_xdotool(key):
    if isinstance(key, keyboard.KeyCode) and key.char:
        return key.char
    if isinstance(key, keyboard.Key):
        return key.name
    return None


def _is_modifier(key):
    return key in modifier_keys


def _callxdotool(command):
    global BongoWindow
    result = subprocess.getoutput(command)
    if "BadWindow" in result:
        print("bad window ID, refinding Bongo")
        _refresh_window_id()


def _send_key(key):
    if not BongoWindow:
        _refresh_window_id()
    if not BongoWindow:
        return

    action = _key_to_xdotool(key)
    if action:
        _callxdotool(f"xdotool key --window {BongoWindow} {action}")


def _send_mouse_click():
    if not BongoWindow:
        _refresh_window_id()
    if not BongoWindow:
        return

    _callxdotool(f"xdotool click --window {BongoWindow} 1")


def on_key_press(key):
    if _is_modifier(key):
        active_modifiers.add(key)
        return

    if not active_modifiers:
        _send_key(key)


def on_key_release(key):
    if _is_modifier(key):
        active_modifiers.discard(key)


def on_click(x, y, button, pressed):
    if pressed:
        _send_mouse_click()


def main():
    _refresh_window_id()

    keyboard_listener = keyboard.Listener(on_press=on_key_press, on_release=on_key_release)
    # mouse_listener = mouse.Listener(on_click=on_click)

    keyboard_listener.start()
    # mouse_listener.start()

    keyboard_listener.join()
    # mouse_listener.join()


if __name__ == "__main__":
    main()
