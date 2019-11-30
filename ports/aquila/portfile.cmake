vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO zsiciarz/aquila
    REF d5e3bde3c8d07678a95f225b657a7bb23d0c4730
    SHA512 8dccfaf7a0c576f76b51310a5e6e1c4a938101d906ab97f98e6518bb9bd6eac785726c8f67cff217a48217e5a63292234138b32aabd17c5566fffa460cbdb7c8
    HEAD_REF master
    PATCHES
        fix-ooura-fft-linking.patch
        fix-shared-libs-build.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DAquila_BUILD_EXAMPLES=OFF
        -DAquila_BUILD_TESTS=OFF
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})

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
