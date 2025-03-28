# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/timer
    REF boost-${VERSION}
    SHA512 b4d9b3659898d47e0835714f2a568a8551eea8577728e9f7a65e494fd49bc474a2db0b79234560529c2d238878854a66d7180f2f2b9d063915c8a150c5af1e29
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
