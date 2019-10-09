include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO liuliu/ccv
    REF de93d8ce558535cf161d3925d1031af7c45c832e
    SHA512 2dbcff471dec2fcdc174d05b6c586f7c96872cb622a8066fa2ff6ef8934250e4f5608051ca35ff23b39eaef90bdf7bf074f543107028ca22e86ba8857b0f0c2e
    HEAD_REF master
)

vcpkg_configure_make(
    SOURCE_PATH ${SOURCE_PATH}/lib
)

vcpkg_build_make()

#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
configure_file(${SOURCE_PATH}/COPYING ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
