vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO CrashRpt/crashrpt2
    REF 0c6ca1054fb7883f092a7c9bae1d5cd44467e33a
    SHA512 91a05bd465920e08a4fda226917c395f0dd79f615e0106216a75e6283199aa7f0e28ebe08e7f35823fbd2c2f0da1d303eb7401b042c1107090d2ec27f2dee4e3
    HEAD_REF master
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" CRASHRPT_BUILD_SHARED_LIBS)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCRASHRPT_BUILD_SHARED_LIBS=${CRASHRPT_BUILD_SHARED_LIBS}
        -DCRASHRPT_BUILD_DEMOS=OFF
        -DCRASHRPT_BUILD_TESTS=OFF
        -DCRASHRPT_INSTALL_PDB=ON
)

vcpkg_cmake_install()

#vcpkg_copy_pdbs()

#vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

#file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
