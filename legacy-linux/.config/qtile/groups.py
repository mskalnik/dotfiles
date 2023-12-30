from libqtile.config import Group, Key
from libqtile.lazy import lazy

from keys import keys, mod

groups = [
  Group(
    "1",
    label="/home",
    spawn=["alacritty --hold -e neofetch", "alacritty -e htop"],
  ),
  Group(
    "2",
    label="/dev0",
    spawn=["code", "alacritty"],
  ),
  Group(
    "3",
    label="/dev1",
    spawn=["code", "alacritty"],
  ),
  Group(
    "4",
    label="/dev2",
    spawn=["code", "alacritty"],
  ),
  Group(
    "5",
    label="/dev3",
    spawn=["code", "alacritty"],
  ),
  Group(
    "6",
    label="/net",
    spawn="firefox",
  ),
  Group(
    "7",
    label="/mus",
    spawn="spotify",
  ),
  Group(
    "8",
    label="/com",
    spawn="discord",
  ),
  Group(
    "9",
    label="/tmp",
  ),
]

for i in groups:
  keys.extend(
    [
      Key(
        [mod],
        i.name,
        lazy.group[i.name].toscreen(),
        desc="Switch to group {}".format(i.name),
      ),
      Key(
        [mod, "shift"],
        i.name,
        lazy.window.togroup(i.name, switch_group=True),
        desc="Switch to & move focused window to group {}".format(i.name),
      ),
    ],
  )
