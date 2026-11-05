---
name: design-review
description: Review this project's KiCad schematic (and optionally PCB) against component datasheets before ordering boards. Use when asked to review, check or sanity-check the schematic, layout, BOM, or a specific circuit (power, MCU, connectors).
---

# Schematic / PCB design review

Work through the project's KiCad files the way a senior reviewer would. The
goal is a findings list the designer can act on in KiCad.

## 1. Gather context

1. Read `docs/design-notes.tex` for requirements, rails and key parts.
2. Export a netlist so connections are explicit rather than inferred from
   S-expression geometry:
   `kicad-cli sch export netlist --format kicadxml -o /tmp/review-netlist.xml hardware/board.kicad_sch`
3. Run `make check` and include any ERC/DRC violations in the review.
4. For each IC, locate its datasheet (`docs/datasheets/` or the symbol's
   `Datasheet` field). Ask the user for missing datasheets rather than
   working from memory.

## 2. Review

Walk `docs/design-review-checklist.md` section by section. Check each item
against the netlist and the datasheet, per IC: pinout, power and decoupling,
strapping and reset pins, pull-ups, absolute maximums, regulator design
(compute feedback dividers and dissipation), and connector protection.

## 3. Report

Group findings by severity:

- **Blocker**: the board won't work or will be damaged (wrong pinout, missing
  rail, exceeded absolute max).
- **Risk**: it may work but is marginal or fragile (low margin, missing ESD,
  no test points).
- **Improvement**: cost, assembly or debug convenience.

For each finding give: reference designator and pin, what's wrong, the
datasheet reference (document, section/table/page), and the suggested fix.
List the assumptions you couldn't verify separately at the end. Do not edit
the KiCad files; the designer applies fixes in KiCad.
