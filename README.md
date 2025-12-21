# My coding stuff!
## LUA
I mostly use luajit version of the lua because its faster, but i don't usually use ffi, so its good.

For proton.lua you need to execute forproton.sh file

Also it makes directories ~/.config/dedlua/ and ~/.local/share/dedlua (the last one is for dependencies)

It also finds every proton in your system and puts it into ~/.config/protons file, where it found every proton. It also makes a ~/.config/dedlua/default.cfg, a file that should look like this:

```
n
1
```

It is by default turned off, the first line is for "n" or "y" values and it defines if your proton autochooses by the next value, a number. A number is a line in the "protons" file that you can freely write and choose.

The third file is ~/.config/dedlua/env, it has YOUR environment variables, you can add to or remove the default ones the forproton.sh, here are they btw:

```
MANGOHUD=1
```

Each environment variable should be on different lines, althought you can just store them in one line if you want, just be sure to add space in the end and at the start of the line. Also you can add gamemoderun to the last line and it will run it!

The fourth file is your proton prefix, which is ~/.config/dedlua/pfx, you can edit the value to choose a different prefix, you can also make a new prefix, just make a new directory, set the value to that directory and run proton.lua boot

Here is the default value for proton:

```
STEAM_COMPAT_DATA_PATH=~/.local/share/dedlua/pfx
```

!!WARNING!!

Every time you execute forproton.sh, it overwrites the "protons", "env" and "default.cfg" with find output and default values!!!
