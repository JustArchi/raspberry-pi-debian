#!/usr/bin/env sh
set -eu

if [ -d "/sys/class/leds" ]; then
	find "/sys/class/leds" -mindepth 1 -maxdepth 1 | while read LED; do
		if [ -f "${LED}/brightness" ]; then
			echo 0 > "${LED}/brightness"
		fi

		if [ -f "${LED}/trigger" ]; then
			echo "none" > "${LED}/trigger"
		fi
	done
fi
