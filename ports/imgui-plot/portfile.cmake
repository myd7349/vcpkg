vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO soulthreads/imgui-plot
    REF ce5f24e56ed14771ce25c60f0d933d2ee77eb468
    SHA512 97f32e6f88584d8e9a8d3e641b4a2470cece665d567f1f10b0bc051f2f49a599aad4f6e266fb2f2015913fcc38ad0940579ffd242b71af4f5a5ac3d1ecb61d2a
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG
        -DIMGUI_SKIP_HEADERS=ON
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()
vcpkg_fixup_cmake_targets()

configure_file(${SOURCE_PATH}/LICENSE.txt ${CURRENT_PACKAGES_DIR}/share/imgui/copyright COPYONLY)
