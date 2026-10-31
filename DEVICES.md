# Devices and Tools

Fields marked **TBD** get filled in from the TV (Settings → System → About) or from `adb shell getprop` during the first session.

## TV 1: Hisense Tornado 2.0 (first target)

| Field | Value |
|---|---|
| Size | 55" |
| Exact model number | TBD (adb reports product songshan_emH, model "Smart TV"; check Settings → About) |
| OS / home screen | Google TV, **Apps-only mode on**. It still shows ads and slows down. |
| Android version / security patch | Android 11 (Google TV), patch 2025-06-01 |
| Firmware / build | 01.00.04.06 (`Hisense/songshan_emH/songshan:11/RTT2.220118.001/01.00.04.06`), MediaTek |
| RAM / storage | 1.75 GB RAM (~580 MB available at idle); /data 6.7 GB, 2.3 GB free |
| Current state | Lags a little; low risk, available now |
| IP address on Wi-Fi | 192.168.1.9 (not reserved in the router yet) |
| Developer options / USB debugging | On. adb authorized over Wi-Fi (2026-10-31). |

## TV 2: Haier (later)

| Field | Value |
|---|---|
| Size | 55" |
| Exact model number | TBD (adb reports product songshan_emH, model "Smart TV"; check Settings → About) |
| OS / home screen | Probably Google TV; Apps-only mode was probably turned on after the latest update. Confirm. |
| Android version / firmware | TBD |
| RAM / storage | TBD |
| Current state | **Very slow and laggy.** Should gain the most. |
| IP address | TBD |

## How the TVs are used

Applies to both TVs; note any differences per TV here.

- **Network:** Wi-Fi, same network as this PC, so ADB over Wi-Fi works
- **Streaming apps:** Hotstar, Prime Video, YouTube, YouTube Music, Netflix, SonyLIV, Zee5, JioCinema, Crunchyroll, Spotify and the other third-party apps (Hisense list in `tvs/hisense/backup-2026-10-31/`). Prime Video and YouTube Music confirmed in use; must keep.
- **Jellyfin client:** watches the Jellyfin server that runs on this PC
- **HDMI inputs:** a set-top box and/or other devices. Keep the input switcher, the TV tuner/source services and HDMI-CEC working.
- Also check during setup: Chromecast / Google Cast, voice search on the remote, Bluetooth remote pairing

## This PC

| Field | Value |
|---|---|
| OS | Windows 11 Home (build 26200) |
| Shells | PowerShell 5.1, Git Bash |
| Claude Code | 2.1.310 |
| Python | 3.12 (`python`), 3.13 (`py`) |
| Node | 24.11 |
| Git | 2.51 |
| winget | 1.29 |
| **adb** | **Not installed yet.** See the checklist. |
| scrcpy | Not installed (optional: mirrors the TV screen to the PC, handy for screenshots) |
| Media server | Jellyfin and related apps run on this PC |
