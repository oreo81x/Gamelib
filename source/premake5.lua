workspace "Gamelib"
    location "../output/build"

    targetdir   ("../output/bin"        .. "/%{cfg.platform}-%{cfg.buildcfg}-%{cfg.system}/%{prj.name}")
    objdir      ("../output/bin-int"    .. "/%{cfg.platform}-%{cfg.buildcfg}-%{cfg.system}/%{prj.name}")

    includedirs { "../source/Public" }

    language        "C++"
    cppdialect      "C++14"
    systemversion   "latest"
    staticruntime   "On"
    
    -- platforms and configurations

    configurations {
        "debug", "release"
    }

    platforms {
        "x64static", "x86static",
        "x64shared", "x86shared"
    }

    -- filtering choices

    filter "configurations:debug"
        runtime "Debug"
        symbols "On"
        optimize "Off"

    filter "configurations:release"
        runtime "Release"
        symbols "Off"
        optimize "On"

        defines {
            "NDEBUG"
        }

    filter "platforms:x64*"
        architecture "x86_64"

    filter "platforms:x86*"
        architecture "x86"

    filter "platforms:*static"
        kind "StaticLib"

    filter "platforms:*shared"
        kind "SharedLib"
    filter {}

    

    project "Gamelib"

        files {
            "../source/Public/Gamelib/**.hpp",
            "../source/Private/Gamelib/**.hpp",
            "../source/Private/Gamelib/**.cpp"
        }

        defines {
            "GAMELIB_EXPORT_BUILD=1"
        }

        filter "kind:StaticLib"

            defines {
                "GAMELIB_STATIC_LINK=1"
            }

        filter "kind:SharedLib"

            defines {
                "GAMELIB_STATIC_LINK=0"
            }

        filter {}

workspace "Gamelib"