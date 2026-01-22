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
I mostly use luajit version of the lua because its faster, but i don't usually use ffi, so it's mostly compatible with standart lua.

## LIBRARIES

Located inside lua/ownlibs is libraries that this project needs, dedlib and rand, they are installed within this repository for convenience and they all copy themselves inside ~/.local/share/dedlua

### DOCUMENTATION

Here is quick links for docs to my own libraries

- [rand](rand.md)
- [dedlib](dedlib.md)
- [simple progress bar](spb.md)

## WARNING

### FIXES
if forlua.sh doesn't make files "env" "default.cfg", delete ~/.config/dedlua/env and/or ~/.config/default.cfg

```bash
rm -f ~/.config/dedlua/env ~/.config/dedlua/default.cfg
```