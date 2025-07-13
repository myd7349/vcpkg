vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO fastlib/fCWT
    REF 49cb5a9ece028ced1365e372b5655ec6b55e08b7
    SHA512 c6f01a6999bae116c6c65b5e1b7d70b101c9ccec7b3c75fd20036c176946c189fdf6d6a14639445675a3dda896e234c9555e86d8bbcf24e60ee35e8a00723364
    HEAD_REF main
    PATCHES
        assert.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DUSE_OWN_FFTW=ON
        -DBUILD_BENCHMARK=OFF
        -DBUILD_MATLAB=OFF
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME fCWT CONFIG_PATH cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
