# My coding stuff!

## Links
- [Installing](#installing)
- [LUA scripts](#lua)
  - [PROTON](proton.md)
  - [LIBRARIES](#libraries)
    - [DOCUMENTATION](#documentation)
- [WARNING](#warning)
  - [FIXES](#fixes)
- [LICENSE](/LICENSE)

## Installing
```bash
git clone https://github.com/gigachad228/Ded-Coding.git
cd Ded-Coding
```

## Installing dependencies
If you have luarocks installed, then just execute ./dependencies.lua, this will install all outside dependencies needed automatically.

## LUA
I mostly use luajit version of lua because its faster, but i try to make sure everything is compatible with both of them, though i advise you to use luajit simply because it's faster and less memory hungry. If you spot a problem or an incompatibility, make sure to either make an issue or make a fix yourself if you can.

## LIBRARIES
Located inside lua/ownlibs is libraries that this project needs, dedlib and rand, they are installed within this repository for convenience and they all copy themselves inside ~/.local/share/dedlua

### DOCUMENTATION
Here is quick links for docs to my own libraries

- [rand](rand.md)
- [dedlib](dedlib.md)
- [simple progress bar](spb.md)

## WARNING
### FIXES
if forlua.sh doesn't make files "env" and/or "default.cfg", but you need them to, delete or rename them both

```bash
mv ~/.config/dedlua/env{,.bac}
mv ~/.config/dedlua/default.cfg{,.bac}
```