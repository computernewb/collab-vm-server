set(_COLLAB_VM_SERVER_SOURCES
		main.cpp
)

add_executable(collab-vm-server ${_COLLAB_VM_SERVER_SOURCES})

target_link_libraries(collab-vm-server Boost::system boost_json spdlog::spdlog )

target_include_directories(collab-vm-server PUBLIC ${PROJECT_SOURCE_DIR}/include)

set_property(TARGET collab-vm-server PROPERTY CXX_STANDARD 17)
set_property(TARGET collab-vm-server PROPERTY CXX_STANDARD_REQUIRED ON)