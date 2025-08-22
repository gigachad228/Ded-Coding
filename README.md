my LUA projects
for proton.lua you need to execute protonfind.sh file
it makes a directory $HOME/.config/dedproton/
it also finds every proton in your system and puts it into "protons" file, where it found every proton. It also makes a "default.cfg", a file that should look like this:
```
n
1
```
it is by default turned off, the first line is for "n" or "y" values and it defines if your proton autochooses by the next value, a number. A number is a line in the "protons" file that you can freely write and choose.
!!WARNING!!
Every time you execute protonfind, it rewrites the "protons" and "default.cfg" with find output and "n" "1"
