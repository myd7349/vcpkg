vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Snaipe/libcsptr
    REF 5bc7aad8cab5f8d9d64308dcffb1a397e86a6b0c
    SHA512 1ca027d590cf1b3055f057ca79249b76d56daf78cd9f03a6ca9b0a5a20fb00e2207f0e77e763870c71ced84e7efafda84b7f4c90629ea7af24227acf619f66a8
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCOVERALLS=OFF
        -DCOVERALLS_UPLOAD=OFF
        -DLIBCSPTR_TESTS=OFF
)

vcpkg_cmake_install()

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

#file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
