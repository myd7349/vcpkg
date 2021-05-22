vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO CrashRpt/crashrpt2
    REF 0c6ca1054fb7883f092a7c9bae1d5cd44467e33a
    SHA512 91a05bd465920e08a4fda226917c395f0dd79f615e0106216a75e6283199aa7f0e28ebe08e7f35823fbd2c2f0da1d303eb7401b042c1107090d2ec27f2dee4e3
    HEAD_REF master
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" CRASHRPT_BUILD_SHARED_LIBS)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCRASHRPT_BUILD_SHARED_LIBS=${CRASHRPT_BUILD_SHARED_LIBS}
        -DCRASHRPT_BUILD_DEMOS=OFF
        -DCRASHRPT_BUILD_TESTS=OFF
        -DCRASHRPT_INSTALL_PDB=ON
)

vcpkg_install_cmake()

vcpkg_copy_tools(
    TOOL_NAMES
        CrashSender1500
        crprober
    AUTO_CLEAN
)
vcpkg_copy_tools(
    TOOL_NAMES
        CrashSender1500d
        crproberd
    SEARCH_DIR ${CURRENT_PACKAGES_DIR}/debug/bin
    DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/debug
    AUTO_CLEAN
)

file(GLOB LANG_FILES "${CURRENT_PACKAGES_DIR}/lang_files/*.*")
file(INSTALL ${LANG_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/lang_files")

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/demos"
    "${CURRENT_PACKAGES_DIR}/debug/docs"
    "${CURRENT_PACKAGES_DIR}/debug/lang_files"
    "${CURRENT_PACKAGES_DIR}/demos"
    "${CURRENT_PACKAGES_DIR}/docs"
    "${CURRENT_PACKAGES_DIR}/lang_files"
)

file(INSTALL ${SOURCE_PATH}/License.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
