workspace "SpaceShooter"
   configurations { "Debug", "Release" }
   location "build"

project "SpaceShooter"
   kind "WindowedApp"
   language "C"
   cdialect "C17"
   targetdir "bin/%{cfg.buildcfg}"

   files { "src/**.h", "src/**.c" }
   defines { "PLATFORM_DESKTOP" }

   includedirs { "include" }
   links { "raylib" }
   warnings "Extra"

   filter "system:macosx"
      kind "ConsoleApp"
      libdirs { "libs/macos/**" }
      links { "OpenGL.framework", "Cocoa.framework", "IOKit.framework", "CoreVideo.framework" }

   filter "system:linux"
      kind "ConsoleApp"
      cdialect "gnu17"
      libdirs { "libs/linux/**" }
      links { "GL", "pthread", "dl", "m", "rt", "X11" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
