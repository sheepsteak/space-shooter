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

   libdirs { "libs/**" }
   includedirs { "include" }
   links { "raylib" }
   warnings "Extra"

   filter "system:macosx"
      kind "ConsoleApp"
      links { "OpenGL.framework", "Cocoa.framework", "IOKit.framework", "CoreVideo.framework" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
