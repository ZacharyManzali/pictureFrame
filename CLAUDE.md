# Project guidance for Claude

This repo is client hardware work: mistakes end up as scrapped boards, not just
failed builds.

## Verification rules

- Never state a pin assignment, footprint, voltage limit or current rating
  without citing the datasheet section or table it came from. If the datasheet
  isn't available, say so; don't fill in from memory.
- Flag assumptions explicitly ("assuming the LDO's dropout is ≤200 mV, check
  table 7.5"), so they can be verified.
- When reviewing, report findings with the reference designator and pin
  (e.g. `U3 pin 12 (NRST)`), not just a net name.

## Files

- Never hand-edit `.kicad_sch` / `.kicad_pcb` structure (symbols, wires,
  footprints). Text variables in `board.kicad_pro` and field values are fine.
  Propose schematic/layout changes as instructions for the designer in KiCad.
- `outputs/` and `build/` are generated; never edit or commit them.
- Datasheets live in `docs/datasheets/` (gitignored, local only).

## Conventions

- Project-specific symbols and footprints go in `hardware/lib/`, never in the
  user's global KiCad libraries, so the repo builds on any machine.
- Every BOM part carries `MPN` and `Manufacturer` fields (and `LCSC` if JLCPCB
  assembles it); the BOM output relies on these field names.
- Hardware revisions are letters (A, B, …) set by the `REVISION` text variable;
  firmware uses semver in `firmware/app/VERSION`. Tags: `hw-revA`, `fw-v0.1.0`.
- Record non-obvious design decisions in `docs/design-notes.md` → Decision log.
