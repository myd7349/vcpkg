include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RichieSams/FiberTaskingLib
    REF 7cafd9126868535f44a82ef7735b35af8fb2c5b3
    SHA512 90562b507ca4f93d8add59f4fe181f95c1e3986e4b70d3c50e5d6f78a809733a61d85ab94b77badc3c297c6aa1bb688460e77c3b2d7c088ac286b028f072193e
    HEAD_REF master
    PATCHES
        cmake-install.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    DISABLE_PARALLEL_CONFIGURE
    PREFER_NINJA
    OPTIONS
        -DFTL_BUILD_TESTS=OFF
        -DFTL_BUILD_BENCHMARKS=OFF
        -DFTL_VALGRIND=OFF
        -DFTL_FIBER_STACK_GUARD_PAGES=OFF
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})

#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
#configure_file(${SOURCE_PATH}/LICENSE.txt ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

# CMake integration test
#vcpkg_test_cmake(PACKAGE_NAME ${PORT})
