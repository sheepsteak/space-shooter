workspace "SpaceShooter"
   configurations { "Debug", "Release" }
   location "build"


project "*"
  cdialect "C17"
  defines { "PLATFORM_DESKTOP" }
  includedirs { "include" }
  language "C"
  links { "raylib" }
  warnings "Extra"

  filter "system:macosx"
    kind "ConsoleApp"
    libdirs { "libs/macos/**" }
    links { "OpenGL.framework", "Cocoa.framework", "IOKit.framework", "CoreVideo.framework" }

  filter "system:linux"
    cdialect "gnu17"
    kind "ConsoleApp"
    libdirs { "libs/linux/**" }
    links { "GL", "pthread", "dl", "m", "rt", "X11" }

  filter "configurations:Debug"
    defines { "DEBUG" }
    symbols "On"

  filter "configurations:Release"
    defines { "NDEBUG" }
    optimize "On"

project "SpaceShooter"
  files { "src/**.h", "src/**.c" }
  kind "WindowedApp"
  removefiles { "src/**_test.c" }
  targetdir "bin/SpaceShooter/%{cfg.buildcfg}"

project "SpaceShooterTests"
  defines { "TEST" }
  files { "src/**.h", "src/**.c" }
  kind "ConsoleApp"
  removefiles { "src/main.c" }
  targetdir "bin/SpaceShooterTests/%{cfg.buildcfg}"
