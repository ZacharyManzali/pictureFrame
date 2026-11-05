# Board overlays

Put devicetree overlays and Kconfig fragments for specific boards here. Zephyr
picks them up automatically by board name:

- `nucleo_f401re.overlay`: devicetree changes for that board (pins, peripherals)
- `nucleo_f401re.conf`: Kconfig options for that board only

Once the custom PCB exists, define it as its own Zephyr board (in
`firmware/boards/<vendor>/<board>/`) instead of overlaying a dev kit.
