# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

date_formatted=$(date "+%m%d_%H%M")

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
battery_charging=$(cat /sys/class/power_supply/BAT0/status)
# battery_level=$(cat /sys/class/power_supply/BAT0/capacity_level)

ip_address=$(hostname -I | rg -o '^[\d.]+')

echo "$ip_address | $battery_level% $battery_charging | $date_formatted"
