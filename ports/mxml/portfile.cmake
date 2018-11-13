include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO michaelrsweet/mxml
    REF v2.12
    SHA512 49233a0087f3ef73a01ef71bb79511af36bb72027e3d9f6df919385e9ff0b03a489a3ccc590941bc4af1f558f82b2ed9bf8ff641863300a7791ce6dddfd56e77
    HEAD_REF master
)

if (TRIPLET_SYSTEM_ARCH MATCHES "x86")
    set(MSBUILD_PLATFORM "Win32")
else ()
    set(MSBUILD_PLATFORM ${TRIPLET_SYSTEM_ARCH})
endif()

vcpkg_build_msbuild(
    PROJECT_PATH ${SOURCE_PATH}/vcnet/mxml1.vcxproj
    PLATFORM ${MSBUILD_PLATFORM}
    USE_VCPKG_INTEGRATION
)

# Install
file(INSTALL
    ${SOURCE_PATH}/mxml.h
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

file(INSTALL
    ${SOURCE_PATH}/vcnet/Debug/${MSBUILD_PLATFORM}/mxml1.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib
)
file(INSTALL
    ${SOURCE_PATH}/vcnet/Debug/${MSBUILD_PLATFORM}/mxml1.dll
    ${SOURCE_PATH}/vcnet/Debug/${MSBUILD_PLATFORM}/mxml1/mxml1.pdb
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin
)

file(INSTALL
    ${SOURCE_PATH}/vcnet/Release/${MSBUILD_PLATFORM}/mxml1.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/lib
)
file(INSTALL
    ${SOURCE_PATH}/vcnet/Release/${MSBUILD_PLATFORM}/mxml1.dll
    DESTINATION ${CURRENT_PACKAGES_DIR}/bin
)

# Handle copyright
configure_file(${SOURCE_PATH}/COPYING ${CURRENT_PACKAGES_DIR}/share/mxml/copyright COPYONLY)
