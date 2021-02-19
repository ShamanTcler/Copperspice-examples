list(APPEND HelloLunch_INCLUDES
   ${CMAKE_CURRENT_SOURCE_DIR}/lunch.h
)
 
list(APPEND HelloLunch_SOURCES
   ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/lunch.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/lunch.ui
   qrc_hellolunch.cpp
)
 
# run rcc to generate qrc output
COPPERSPICE_RESOURCES(
   ${CMAKE_CURRENT_SOURCE_DIR}/../hellolunch.qrc
)
 
# run uic to generate source
COPPERSPICE_RESOURCES(
   ${CMAKE_CURRENT_SOURCE_DIR}/lunch.ui
)
 
add_executable(HelloLunch
   ${HelloLunch_SOURCES}
)
 
target_include_directories(HelloLunch
   PRIVATE
   ${CMAKE_SOURCE_DIR}/src
)
 
target_link_libraries(HelloLunch
   CopperSpice::CsCore
   CopperSpice::CsGui
)
 
if(CMAKE_SYSTEM_NAME MATCHES "Windows")
   # disable console on windows
   target_link_libraries(HelloLunch -lnetapi32 -lmpr -mwindows)
endif()
 
install(TARGETS HelloLunch DESTINATION .)