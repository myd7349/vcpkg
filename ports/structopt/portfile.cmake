# header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO p-ranav/structopt
    REF 6c36b3bf1bfe3e1b8038ca2a747bce6ed22ee62d
    SHA512 4dffaa2d078fcf1e9ccde01a0f6a7561b4e848b14c58d729942144fcd678a45660740d64f21a0fe624e13cc6a75443a73068af9374808dc6de9d81a3f0da280b
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DSTRUCTOPT_TESTS=OFF
        -DSTRUCTOPT_SAMPLES=OFF
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
    "${CURRENT_PACKAGES_DIR}/share/licenses"
)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(INSTALL ${SOURCE_PATH}/LICENSE.magic_enum DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
file(INSTALL ${SOURCE_PATH}/LICENSE.visit_struct DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
