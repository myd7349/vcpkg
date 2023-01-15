vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO skywind3000/kcp
    REF 5481f0397f0809d802bd551e363a0252f1d8b672
    SHA512 85b96561128e09ba0ac666c8f662af3707443abc3e3c352742ed05b6c2b870aa821ad290d7d2b93c352c7d9b0c1d8a2071ff0b90172487081893733b6739c7be
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Handle copyright
configure_file("${SOURCE_PATH}/LICENSE" "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" COPYONLY)
