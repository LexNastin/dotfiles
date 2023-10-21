#!/bin/sh

CHARGE_NOW=$(cat /sys/class/power_supply/macsmc-battery/charge_now)
CHARGE_FULL=$(cat /sys/class/power_supply/macsmc-battery/charge_full)
POWER_DRAW=$(cat /sys/class/power_supply/macsmc-battery/power_now)

PCT=$(python3 -c "print(round($CHARGE_NOW / $CHARGE_FULL * 100, 4))")
PWR=$(python3 -c "print(round($POWER_DRAW / 1000000, 4))")

echo "$PCT%"
echo "${PWR}W"
