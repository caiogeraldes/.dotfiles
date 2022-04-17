#! /usr/bin/env python

from i3pystatus import Status

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %d/%m %X",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
# status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)

# This would look like this:
# Discharging 6h:51m
status.register("battery",
    format="{percentage:.1f}%",
    alert=True,
    alert_percentage=20,
    # status={
        # "DIS":  "Desc.",
        # "CHR":  "Carr.",
        # "FULL": "Cheia",
    # },)
    )

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format="{avail}/{total}G",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
# status.register("pulseaudio",
    # format="♪{volume}",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("spotify",
    format="{title} {status} {artist}",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },
    hints = {"min_width":200}
)

status.run()
