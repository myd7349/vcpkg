include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pbatard/libwdi
    REF v1.3.0
    SHA512 d8c2c9890f66706ea2d14f0dfbdc479cd25adbf02b3a15c5b90f8bd675ce4dd02a60ece98e90d912082689982d47a1bcc6d47b39e44764d37c29bdc02ca499d3
    HEAD_REF master
)

if(TRIPLET_SYSTEM_ARCH MATCHES "x86")
    set(MSBUILD_PLATFORM "Win32")
else()
    set(MSBUILD_PLATFORM ${TRIPLET_SYSTEM_ARCH})
endif()

if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    set(LIBWDI_PROJECT libwdi_dll.vcxproj)
else()
    set(LIBWDI_PROJECT libwdi_static.vcxproj)
endif()

vcpkg_build_msbuild(
    PROJECT_PATH ${SOURCE_PATH}/libwdi/.msvc/${LIBWDI_PROJECT}
    PLATFORM ${MSBUILD_PLATFORM}
    USE_VCPKG_INTEGRATION
)

# Install
#file(INSTALL
#    ${SOURCE_PATH}/mxml.h
#    DESTINATION ${CURRENT_PACKAGES_DIR}/include
#)

#file(INSTALL
#    ${SOURCE_PATH}/vcnet/Debug/${MSBUILD_PLATFORM}/mxml1.lib
#    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib
#)
#file(INSTALL
#    ${SOURCE_PATH}/vcnet/Debug/${MSBUILD_PLATFORM}/mxml1.dll
#    ${SOURCE_PATH}/vcnet/Debug/${MSBUILD_PLATFORM}/mxml1/mxml1.pdb
#    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin
#)

#file(INSTALL
#    ${SOURCE_PATH}/vcnet/Release/${MSBUILD_PLATFORM}/mxml1.lib
#    DESTINATION ${CURRENT_PACKAGES_DIR}/lib
#)
#file(INSTALL
#    ${SOURCE_PATH}/vcnet/Release/${MSBUILD_PLATFORM}/mxml1.dll
#    DESTINATION ${CURRENT_PACKAGES_DIR}/bin
#)

# Handle copyright
configure_file(${SOURCE_PATH}/COPYING ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
