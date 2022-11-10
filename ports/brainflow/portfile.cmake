vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brainflow-dev/brainflow
    REF 5ddb7808fad562df5bb33915b1a00bc454f7ebc4 # 5.4.0
    SHA512 f41e8a7fae1677a168492c90b6f1c096a879b73cccb6eb989c17a72a29b0e57626b6c3e54ca56e359d98eeda83c25c386cc83b0e21864c727b01550ec79fc2e1
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTS=OFF
)

vcpkg_cmake_install()

#if(MARL_BUILD_SHARED)
#    vcpkg_replace_string(
#        "${CURRENT_PACKAGES_DIR}/include/marl/export.h"
#        "#ifdef MARL_DLL"
#        "#if 1  // #ifdef MARL_DLL"
#    )
#endif()

#vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")

#vcpkg_copy_pdbs()

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

#file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
