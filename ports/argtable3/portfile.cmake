vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO argtable/argtable3
    REF e58754ed716542a54f75a9c9ba5c85a057b8ea00
    SHA512 2ef66152b81e5da8b10b5c86e17d8a32fa1c59f8df8d1d69ccba87c33c926e3894d4318ca0439926b430489cfeccc960443445d5523922670a4c947a3de27d83
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DARGTABLE3_ENABLE_CONAN=OFF
        -DARGTABLE3_ENABLE_TESTS=OFF
        -DARGTABLE3_BUILD_STATIC_EXAMPLES=OFF
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

if(EXISTS ${CURRENT_PACKAGES_DIR}/cmake)
    vcpkg_fixup_cmake_targets(CONFIG_PATH cmake)
elseif(EXISTS ${CURRENT_PACKAGES_DIR}/lib/cmake/${PORT})
    vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})
endif()

file(COPY
    ${CMAKE_CURRENT_LIST_DIR}/vcpkg-cmake-wrapper.cmake
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/include
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    vcpkg_replace_string(
        "${CURRENT_PACKAGES_DIR}/include/argtable3.h"
        "defined(argtable3_IMPORTS)"
        "1 // defined(argtable3_IMPORTS)"
    )
endif()

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

# CMake integration test
vcpkg_test_cmake(PACKAGE_NAME ${PORT})
