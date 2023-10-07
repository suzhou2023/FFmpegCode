cmake_minimum_required(VERSION 3.22.1)

project("ffmpeg")


include_directories("${CMAKE_CURRENT_SOURCE_DIR}")




add_subdirectory(compat)
add_subdirectory(fftools)
add_subdirectory(libavcodec)
add_subdirectory(libavdevice)
add_subdirectory(libavfilter)
add_subdirectory(libavformat)
add_subdirectory(libavutil)
add_subdirectory(libpostproc)
add_subdirectory(libswresample)
add_subdirectory(libswscale)
add_subdirectory(tools)

