# Lua library configured with Premake5

This project is a simple Premake5 configuration of Lua. The following builds are available:

* Shared library 32 bit or 64 bit
* Static library 32 bit or 64 bit

## Build

Fetch this project along with Lua sources
```
git clone --recurse-submodules git@github.com:KyrietS/LuaLib.git
```

Generate project files
```
premake5 (vs2019|gmake2|...)
```

Done.

Note: header files needed for using Lua library are automatically copied into `build/bin/{CONFIG}/include` directory. For Windows dll Visual Studio will also create an import library.

## Use Lua in existing Premake5 project

*Work in progress*