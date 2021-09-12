workspace "Lua"

	configurations {"Static32", "Static64", "Shared32", "Shared64"}

	filter "configurations:Static*"
		kind "StaticLib"
	filter "configurations:Shared*"
		kind "SharedLib"

	filter "configurations:*32"
		architecture "x86_64"
		targetsuffix "32"
	filter "configurations:*64"
		architecture "x64"
		targetsuffix "64"

	-- use Windows's specific extensions dllexport, dllimport
	-- in order to automatically create import library
	filter {"configurations:Shared*", "system:windows"}
		defines { "LUA_BUILD_AS_DLL" }

	filter {}

	targetdir "build/bin/%{cfg.buildcfg}"
	objdir "build/obj/%{cfg.buildcfg}/%{prj.name}"

	project "LuaLib"
		targetname "lua"
		language "C"
		warnings "Off"
		symbols "Off"
		optimize "On"
		files {"lua/onelua.c"}
		files {
			"lua/lua.h",
			"lua/luaconf.h",
			"lua/lualib.h",
			"lua/lauxlib.h",
		}
		
		postbuildcommands {
			"{MKDIR} %{cfg.buildtarget.directory}/include",
			"{COPY} lua/lua.h %{cfg.buildtarget.directory}/include/",
			"{COPY} lua/luaconf.h %{cfg.buildtarget.directory}/include/",
			"{COPY} lua/lualib.h %{cfg.buildtarget.directory}/include/",
			"{COPY} lua/lauxlib.h %{cfg.buildtarget.directory}/include/"
		}
