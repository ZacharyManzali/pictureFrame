# Bring-up Checklist

Work through in order on the first board. Record results (measured values,
photos, scope captures) in a copy of this file per board serial number.

**Board S/N:** · **Date:** · **Assembled by:**

## 1. Before power

- [ ] Visual inspection: solder bridges, part orientation, missing parts
- [ ] Resistance from each rail to GND (look for shorts; note values)

## 2. First power (current-limited bench supply)

- [ ] Current limit set low (e.g. 50–100 mA); note the idle current
- [ ] Each rail measured within tolerance

| Rail | Expected | Measured | OK |
|---|---|---|---|

- [ ] No hot parts (finger test or thermal camera)

## 3. MCU

- [ ] Debug probe connects (SWD/JTAG)
- [ ] Bring-up firmware flashes (`make flash`) and the LED blinks
- [ ] UART log shows the version string
- [ ] Clock source verified (crystal running, correct frequency)

## 4. Peripherals (one at a time)

| Interface | Device | Test | Result |
|---|---|---|---|

## 5. Issues found

| # | Symptom | Root cause | Fix (rework now / next revision) |
|---|---|---|---|
