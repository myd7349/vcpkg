# header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lava/matplotlib-cpp
    REF ef0383f1315d32e0156335e10b82e90b334f6d9f
    SHA512 fde0700dc6cd43ca041a684a2ab21ae5228f63b472bce4ecf8ad958bda1344fe05d46836c72af0aa5e5a49d19164c3b84b054f899eb0bbb6bdeb5ad0cab15a60
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME matplotlib_cpp CONFIG_PATH "lib/matplotlib_cpp/cmake")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE" "${SOURCE_PATH}/LICENSE.matplotlib")
