# Hardware Project Template

Starting point for embedded hardware projects: KiCad 9 schematic and PCB,
Zephyr RTOS firmware, and CI that produces a full fabrication package on every
push. Built entirely on open-source tools.

## Starting a new project

1. On GitHub, click **Use this template** (or `gh repo create <name> --private --template <this repo>`).
2. Open `hardware/board.kicad_pro` → **File → Project Settings → Text Variables**
   and set `PROJECT_TITLE`, `CLIENT` and `REVISION`. They fill the title block on
   every sheet and the output file names.
3. Fill in `docs/design-notes.md` (requirements and decisions) before drawing anything.
4. Set the MCU's HAL module in `west.yml` and the dev-kit board in
   `.github/workflows/firmware.yml`.

## Layout

| Path | Contents |
|---|---|
| `hardware/` | KiCad project, project-local libraries (`lib/`), `kibot.yaml` |
| `firmware/app/` | Zephyr application (`VERSION` sets the firmware version) |
| `west.yml` | Pinned Zephyr version and modules |
| `docs/` | Design notes, review and bring-up checklists |
| `.github/workflows/` | CI for hardware outputs and firmware builds |

## Local commands

```sh
make check   # ERC + DRC (needs only KiCad)
make hw      # all fab/assembly/doc outputs -> outputs/  (needs KiBot)
make fw      # build firmware (BOARD=nucleo_f401re by default)
make flash   # flash the last firmware build
```

### One-time tool setup

**KiBot** (hardware outputs), in its own Python environment:

```sh
/usr/bin/python3 -m venv --system-site-packages ~/.venvs/kibot
~/.venvs/kibot/bin/pip install --no-compile kibot "git+https://github.com/INTI-CMNB/InteractiveHtmlBom"
```

**Zephyr** (firmware): follow the
[Zephyr Getting Started guide](https://docs.zephyrproject.org/latest/develop/getting_started/index.html)
for system packages and the Zephyr SDK, then create a workspace per project:

```sh
mkdir <project>-ws && cd <project>-ws
git clone <repo-url> project
/usr/bin/python3 -m venv .venv && source .venv/bin/activate
pip install west
west init -l project && west update
west packages pip --install
cd project && make fw
```

## Releasing to a client

1. `make check` passes and `docs/design-review-checklist.md` is complete.
2. Bump `REVISION` (hardware) and/or `firmware/app/VERSION`.
3. Tag the commit (`git tag hw-revA`, `git tag fw-v0.1.0`) and push the tag.
4. Download the CI artifacts and attach them to a GitHub Release. That release
   is the deliverable.
