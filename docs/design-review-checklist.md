# Design Review Checklist

Complete before ordering boards. AI review is a first pass; every item is
signed off by checking the datasheet yourself.

## Schematic

- [ ] Every IC's pins match its datasheet pinout, including exposed/thermal pads
- [ ] Every power pin is connected and has decoupling per the datasheet (values and placement notes)
- [ ] Enable, reset, boot-mode and other strapping pins are tied to a defined level
- [ ] Open-drain lines (I2C, interrupts, resets) have pull-ups to the correct rail
- [ ] No pin exceeds its absolute maximum voltage (watch mixed 5 V / 3.3 V / 1.8 V signals)
- [ ] Regulators: input/output caps (type, ESR, voltage rating), feedback divider math, thermal dissipation
- [ ] Power-up sequencing requirements are met
- [ ] Protection on external connectors: ESD, reverse polarity, overcurrent
- [ ] Debug/programming header (SWD/JTAG + UART) is present and accessible
- [ ] Test points on every rail and key signals
- [ ] Every part has MPN and Manufacturer fields; parts are in stock with a second source where possible
- [ ] ERC clean, or each remaining warning explained

## Layout

- [ ] Footprints verified against the datasheet's land pattern (pin 1, pitch, pad sizes)
- [ ] Decoupling caps next to their pins, with short paths to ground
- [ ] Unbroken ground plane under high-speed signals; no slots under traces
- [ ] Switching regulator loop area minimized per its layout guide
- [ ] Trace widths sized for current; impedance-controlled traces match the fab's stackup
- [ ] Crystal close to the MCU, guarded, with no traces underneath
- [ ] Antenna keep-out respected (if wireless)
- [ ] Mounting holes, board outline and connector positions match the enclosure (check the STEP export)
- [ ] Silkscreen: reference designators readable, polarity and pin 1 marked, revision and date on the board
- [ ] DRC clean against the chosen fab's capabilities

## Fabrication package

- [ ] `make hw` / CI passes; open the Gerbers in a viewer (KiCad GerbView) and inspect every layer
- [ ] BOM and pick-and-place files line up (references, rotations)
- [ ] Revision bumped and commit tagged
