# Archi running Debian on RPI

Stuff I consider useful for further integration between Debian and Raspberry Pi 4.

This is based on personal experience, YMMV, but I believe it'll come useful for you.

---

# Setup

Pick the files you need/want in appropriate directories:

## ArchiBoot

### What it does: executes `/root/autostart.sh` on boot, which disables all LEDs

- `/etc/systemd/system/ArchiBoot.service`, `systemctl daemon-reload && systemctl enable ArchiBoot` afterwards
- `/root/autostart.sh`, you may need to `chmod +x` it

## Bootloader upgrade

### What it does: allows you to upgrade bootloader on non-raspi OSes

- `/etc/default/rpi-eeprom-update`, for `rpi-eeprom-update` to work properly on Debian

## `vcgencmd`

### What it does: allows you to execute various commands, e.g. `vcgencmd bootloader_version`

- `/lib/aarch64-linux-gnu` for required libraries that `vcgencmd` depends on
- `/usr/bin/vcgencmd` for `vcgencmd` command, you may need to `chmod +x` it

---

# Bootloader upgrade

1. Clone official git repo with `rpi-eeprom-update`:

```sh
# Clone the repository
git clone https://github.com/raspberrypi/rpi-eeprom
```

2. Navigate to it and execute commands below for upgrade:

```sh
# Navigate to previously cloned repository
cd /path/to/rpi-eeprom

# Useful to ensure you have latest firmwares available
git pull

# Yes, this is required for rpi-eeprom-update functionality
export PATH="${PATH}:$(pwd)"

# Find and schedule bootloader upgrade if needed
rpi-eeprom-update -a

# If needed, that is, new version of bootloader firmware is pending for update
reboot
```
