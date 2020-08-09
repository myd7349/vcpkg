vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cycfi/elements
    REF 71c48011fc2b26ccbfade0ef8cbccf4ff3e7462e
    SHA512 69bdc10a1d544139bd679630beb81767b318428bc3e186b49936adffff32c2c0981e4d3a1bbfda0ce23c2015d9103a28735176d643e368543254eeca2a2c3cfe
    HEAD_REF master
)

vcpkg_from_github(
    OUT_SOURCE_PATH CYCFI_INFRA_SOURCE_PATH
    REPO cycfi/infra
    REF 2cce3b92e374117c31ef2bff0ea46d2b726255fd
    SHA512 db5dbc07b7e624e899babce1c187d1da021b7c82cd7c51c6a765b0743c5b67470de2d8ec41a3888ec5eaa370163e5a5e6fc214d2fcb0e62b34d2c7a4103386a2
    HEAD_REF master
)

file(REMOVE_RECURSE ${SOURCE_PATH}/lib/infra)
get_filename_component(CYCFI_INFRA_SOURCE_DIR_NAME ${CYCFI_INFRA_SOURCE_PATH} NAME)
file(COPY ${CYCFI_INFRA_SOURCE_PATH} DESTINATION ${SOURCE_PATH}/lib)
file(RENAME ${SOURCE_PATH}/lib/${CYCFI_INFRA_SOURCE_DIR_NAME} ${SOURCE_PATH}/lib/infra)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DELEMENTS_BUILD_EXAMPLES=OFF
)

vcpkg_build_cmake()

#vcpkg_install_cmake()

#vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})

#vcpkg_copy_pdbs()

#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

#file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
