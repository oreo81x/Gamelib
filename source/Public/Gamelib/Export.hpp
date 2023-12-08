#pragma once

/*
 *  Gamelib library configuration header
 */

#if GAMELIB_STATIC_LINK

    #define GAMELIB_API_EXPORT
    #define GAMELIB_API_IMPORT

#else

    #if defined(_WIN32)

        #define GAMELIB_API_EXPORT __declspec(dllexport)
        #define GAMELIB_API_IMPORT __declspec(dllimport)

        #if defined(_MSC_VER)

            #pragma warning(disable:4251)

        #endif

    #else

        #if __GNUC__ >= 4

            #define GAMELIB_API_EXPORT __attribute__((__visibility__("default")))
            #define GAMELIB_API_IMPORT __attribute__((__visibility__("default")))

        #else

            #define GAMELIB_API_EXPORT
            #define GAMELIB_API_IMPORT

        #endif

    #endif

#endif

#if GAMELIB_EXPORT_BUILD

    #define GAMELIB_API GAMELIB_API_EXPORT

#else

    #define GAMELIB_API GAMELIB_API_IMPORT

#endif

#if defined(NDEBUG)

    #define GAMELIB_DEBUG_ENABLED 0

#else

    #define GAMELIB_DEBUG_ENABLED 1

#endif

namespace Gamelib
{
}
