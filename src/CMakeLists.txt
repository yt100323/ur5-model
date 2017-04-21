SET(UisFiles ur5model.ui)
SET(MocSrcFiles)
QT5_WRAP_CPP(MocSrcFiles ur5model.hpp)
SET(RccSrcFiles)
QT5_ADD_RESOURCES(RccSrcFiles resources.qrc)
QT5_WRAP_UI(UiHeaders ${UisFiles})

SET(CMAKE_INCLUDE_CURRENT_DIR ON)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})

add_library(ur5model MODULE ur5model.cpp
  ${MocSrcFiles}
  ${RccSrcFiles}
  ${UiHeaders}
)
target_link_libraries(ur5model $ROBWORK_LIBRARIES $ROBWORKSTUDIO_LIBRARIES $ROBWORKSIM_LIBRARIES)
