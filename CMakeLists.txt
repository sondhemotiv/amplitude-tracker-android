cmake_minimum_required(VERSION 3.16)

project(amplitude-tracker-android VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appamplitude-tracker-android
    main.cpp
)

qt_add_qml_module(appamplitude-tracker-android
    URI amplitude-tracker-android
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Screen1.qml
        QML_FILES Screen2.qml
        SOURCES AmplitudeTracker.h AmplitudeTracker.cpp
        RESOURCES android/AndroidManifest.xml android/build.gradle android/res/values/libs.xml android/gradle/wrapper/gradle-wrapper.jar android/gradle/wrapper/gradle-wrapper.properties android/gradle.properties android/gradlew android/gradlew.bat
        # RESOURCES android/src/com/emotiv/consumerapp/MainActivity.java
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appamplitude-tracker-android PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appamplitude-tracker-android
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appamplitude-tracker-android
    PRIVATE Qt6::Quick
)

if (ANDROID)
    file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/android/src/com DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/android-build/src)
endif()

include(GNUInstallDirs)
install(TARGETS appamplitude-tracker-android
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
