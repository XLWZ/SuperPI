cmake_minimum_required(VERSION 3.13)
project(pi_benchmark C)

add_executable(pi_css5 pi_fftcs.c fftsg_h.c)

if(MSVC)
    target_compile_options(pi_css5 PRIVATE /W4 /fp:fast)
else()
    target_compile_options(pi_css5 PRIVATE -Wall -pedantic -O -fomit-frame-pointer -funroll-loops -malign-double)
    target_link_options(pi_css5 PRIVATE -static)
endif()
