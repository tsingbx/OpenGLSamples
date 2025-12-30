function(AddExe projName ICON)

add_executable(${projName} WIN32 MACOSX_BUNDLE ${ICON} ${ARGN})

target_link_libraries(${projName} PRIVATE glad)

set_target_properties(${projName} PROPERTIES 
                            CXX_STANDARD 17)

if (MSVC)
    # Tell MSVC to use main instead of WinMain
    set_target_properties(${projName} PROPERTIES
                            LINK_FLAGS "/ENTRY:mainCRTStartup")
elseif (CMAKE_C_SIMULATE_ID STREQUAL "MSVC")
    # Tell Clang using MS CRT to use main instead of WinMain
    set_target_properties(${projName} PROPERTIES
                            LINK_FLAGS "-Wl,/entry:mainCRTStartup")
endif()

if (APPLE)
    set_target_properties(${projName} PROPERTIES
                            MACOSX_BUNDLE_BUNDLE_NAME ${projName})

    set_source_files_properties(${ICON} PROPERTIES
                                MACOSX_PACKAGE_LOCATION "Resources")

    set_target_properties(${projName} PROPERTIES
                            MACOSX_BUNDLE_SHORT_VERSION_STRING ${CMAKE_PROJECT_VERSION}
                            MACOSX_BUNDLE_LONG_VERSION_STRING ${CMAKE_PROJECT_VERSION}
                            MACOSX_BUNDLE_ICON_FILE ${ICON}
                            MACOSX_BUNDLE_INFO_PLIST "${CMAKE_SOURCE_DIR}/CMake/Info.plist.in")
endif()

    
endfunction(AddExe projName)

