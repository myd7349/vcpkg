vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO open-license-manager/open-license-manager
    REF 555457c5d722885c03e63405dc186ca6ba62a0f1
    SHA512 46096cfaa18446fd215e58771b7f0ff9b531c268273e35b823a81f686ae5805624328aeb55e88cbdd5356db07142910778ac2175a4ed19ca53e1f2da190fad34
    HEAD_REF master
    PATCHES
        #find-boost-quietly.patch
)

vcpkg_from_github(
    OUT_SOURCE_PATH LCC_SOURCE_PATH
    REPO open-license-manager/lcc-license-generator
    REF 6127a024d19f3fae83db3c3ee3f123860291b962
    SHA512 d4bd2d2cdab18234d45046460eaa37400c91fff3734c1ae29d166f8c652823f5e779dde0ea50dfdbb252d9a51d1fa977b02d8f89f11e33309bceea2c5ae4a0d4
    HEAD_REF master
)

file(REMOVE_RECURSE ${SOURCE_PATH}/extern/license-generator)

get_filename_component(LCC_SOURCE_DIR_NAME ${LCC_SOURCE_PATH} NAME)
file(COPY ${LCC_SOURCE_PATH} DESTINATION ${SOURCE_PATH}/extern)
file(RENAME ${SOURCE_PATH}/extern/${LCC_SOURCE_DIR_NAME} ${SOURCE_PATH}/extern/license-generator)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

#if(tools IN_LIST FEATURES)
#endif()

#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)

#file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
