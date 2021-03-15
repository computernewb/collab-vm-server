cmake_minimum_required(VERSION 3.17)
project(collab-vm-server LANGUAGES CXX DESCRIPTION "CollabVM Server 1.3")

# Grab boost
set(Boost_NO_BOOST_CMAKE OFF)
find_package(Boost REQUIRED COMPONENTS system)

add_subdirectory(vendor)
add_subdirectory(src)