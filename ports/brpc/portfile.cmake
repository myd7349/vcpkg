include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO apache/incubator-brpc
    REF 71af31e4038f4dd5138d954237652e96d9613e90
    SHA512 70d6c2f0d7112f41e9fef179dab90c410ec7f6098c51197d009761cb3d92d38ee43e5d10041d64b4027f45aebed3c70871b32ee5b455982096bdb7388dbd86ad
    HEAD_REF master
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" BUILD_STATIC_LIBS)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DWITH_GLOG=OFF
        -DDEBUG=OFF
        -DWITH_DEBUG_SYMBOLS=OFF
        -DWITH_THRIFT=OFF
        -DBUILD_UNIT_TESTS=OFF
        -DDOWNLOAD_GTEST=OFF
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

#vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})

#file(REMOVE_RECURSE
#    ${CURRENT_PACKAGES_DIR}/debug/include
#    ${CURRENT_PACKAGES_DIR}/debug/share
#)

#if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
#    vcpkg_replace_string(${CURRENT_PACKAGES_DIR}/include/xeus/xeus.hpp
#        "#ifdef XEUS_STATIC_LIB"
#        "#if 1 // #ifdef XEUS_STATIC_LIB"
#    )
#endif()

# Handle copyright
#configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

# CMake integration test
#vcpkg_test_cmake(PACKAGE_NAME ${PORT})
