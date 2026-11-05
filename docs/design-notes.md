# Design Notes: pictureFrame

**Owner:** Zachary Manzali · **Revision:** A · **Status:** Requirements

Digital picture frame built from COTS parts around a Raspberry Pi. No custom PCB is planned yet.

## Requirements

| # | Requirement | Source | Verified by |
|---|---|---|---|
| R-DSP-1 | 10" class IPS display (good viewing angles) | Owner, 2026-11-04 | Datasheet / panel spec |
| R-DSP-2 | Capacitive touch: swipe for next/previous, tap to pause | Owner | Bench test |
| R-DSP-3 | Resolution ≥ 1280×800 (target, confirm in trade study) | Owner | Datasheet |
| R-MEC-1 | Total depth ≤ 25 mm including Pi, drive and cables | Owner | Stack-up drawing, then measurement |
| R-MEC-2 | Front: store-bought picture/shadow-box frame. Rear: 3D-printed shell holding the electronics | Owner | Fit check |
| R-MEC-3 | Wall-hang and desk-stand; landscape (portrait is a stretch goal) | Owner | Fit check |
| R-MEC-4 | Passive cooling only (no fan); vents in rear shell | Owner | Thermal soak test |
| R-CMP-1 | Raspberry Pi; model chosen by trade study (Zero 2 W vs 4 vs 5) against R-MEC-1 and software load | Owner | Trade study |
| R-STO-1 | External USB drive, ≥ 1 TB target, low-profile (2.5" SSD or M.2 enclosure), mounted flat | Owner | Stack-up, datasheet |
| R-STO-2 | OS on microSD (or boot from SSD); photos on the external drive | Owner | Bench test |
| R-NET-1 | Wi-Fi (onboard Pi Wi-Fi) | Owner | Bench test |
| R-UPL-1 | SMB network share for drag-and-drop from PC/Mac | Owner | Bench test |
| R-UPL-2 | Web upload page that works from a phone browser | Owner | Bench test |
| R-UPL-3 | Email-to-frame: photos emailed to a dedicated address are fetched (IMAP poll) and added | Owner | Bench test |
| R-UPL-4 | Uploads limited to the home network or require auth; no open internet exposure | Owner | Review |
| R-FTR-1 | Slideshow with configurable interval, shuffle and EXIF auto-rotate | Owner | Bench test |
| R-FTR-2 | Scheduled screen on/off (for example off overnight) | Owner | Bench test |
| R-FTR-3 | PIR motion sensor wakes the display | Owner | Bench test |
| R-FTR-4 | Ambient light sensor drives auto-brightness (needs software-controllable backlight; check in trade study) | Owner | Bench test |
| R-PWR-1 | Single wall power cable into the frame, feeding Pi, panel and drive | Owner | Review |
| R-PWR-2 | Power budget with ≥ 20% margin, calculated from datasheets | Owner | Power budget below |
| R-PWR-3 | Used in Brazil (127 V or 220 V depending on region, 60 Hz): PSU must be universal input, 100–240 VAC, 50/60 Hz | Owner | PSU datasheet |
| R-PWR-4 | Plug is Brazilian NBR 14136 (Type N), on the PSU or on a detachable cord (for example IEC C7/C8) so the cord can be bought locally | Owner | Review |
| R-PWR-5 | Prefer INMETRO-certified PSU; mains stays outside the frame (external brick) so the enclosure only carries low-voltage DC | Owner | PSU listing |
| R-CST-1 | Parts ≤ $300, drive not included | Owner | BOM |

## Constraints

- Board size / enclosure: ≤ 25 mm total depth, 10" class panel, store-bought front frame with 3D-printed rear shell.
- Operating environment: indoor, Brazil, room temperature (confirm ambient range for the thermal test).
- Target unit cost / volume: ≤ $300 excluding drive, one unit.
- Certifications: none for the build itself; PSU should carry INMETRO.

## Known tensions (open, not decided)

- ≤ 25 mm depth vs Pi 4/5 port height: needs a Pi Zero 2 W, a Pi 4/5 with right-angle or flat cables, or the board mounted beside the panel instead of behind it.
- Touch plus software-dimmable backlight plus 10" narrows the panel choices.
- Pi Zero 2 W RAM vs running SMB, web upload, email fetch and slideshow together.

## Block diagram

<!-- Power, Pi, display, storage, sensors. Add once parts are chosen. -->

## Key parts

| Function | Part | Why | Datasheet |
|---|---|---|---|
| Compute | TBD | | |
| Display | TBD | | |
| Storage | TBD | | |
| Power supply | TBD | | |

## Power budget

| Rail | Source | Max load | Notes |
|---|---|---|---|

## Decision log

| Date | Decision | Reason | Alternatives rejected |
|---|---|---|---|
| 2026-11-04 | Use Raspberry Pi as the compute platform | Cost-effective, built-in Wi-Fi, USB storage | Not yet compared against alternatives |
| 2026-11-04 | Store-bought front frame plus 3D-printed rear shell | Easier than a fully printed or wood enclosure | Fully 3D-printed, woodworking |
