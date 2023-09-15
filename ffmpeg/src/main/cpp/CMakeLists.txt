cmake_minimum_required(VERSION 3.22.1)

project("ffmpeg")


include_directories("${CMAKE_CURRENT_SOURCE_DIR}")





add_subdirectory(libavformat)
add_subdirectory(libavutil)
