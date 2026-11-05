# Project guidance for Claude

DIY digital picture frame: COTS hardware around a Raspberry Pi, with Python software. See `docs/design-notes.tex` for requirements and `docs/trade-studies.tex` for open part choices.

## Verification rules

- Never state a pin assignment, dimension, voltage limit or current rating
  without citing the datasheet section or table it came from. If the datasheet
  isn't available, say so; don't fill in from memory.
- Flag assumptions explicitly, so they can be verified.

## Files

- Documentation (design notes, trade studies, reports) is written in LaTeX (`.tex`, build with `latexmk -pdf`); README.md stays Markdown.
- Datasheets live in `docs/datasheets/` (gitignored, local only).
- `outputs/` and `build/` are generated; never edit or commit them.

## Conventions

- Requirements have IDs (R-DSP-1, R-UPL-3, ...) and each one is a GitHub issue with the same ID, labelled `hardware` and/or `software`.
- Software is Python (pygame for the slideshow, Flask for web upload) under `software/`.
- Record non-obvious design decisions in `docs/design-notes.tex` → Decision log.
