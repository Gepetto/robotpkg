# interfaces/ros2-rosidl/files/plist-generator.mk
#                                           Anthony Mallet on Thu Aug 17 2023
#

# See interfaces/ros2-rosidl/files/plist-generator.awk for details
END {
    if (rosidl_typesupport_fastrtps)
        plist["@comment filtered by rosidl-typesupport-fastrtps generator.awk"]
}

NF > 3 && $1 == "share" && $NF == "idl" {
    rosidl_typesupport_fastrtps = 1
    base_ = decamel($(NF-1))
    rosidl_typesupport_fastrtps_c($2, $(NF-2), base_)
    rosidl_typesupport_fastrtps_cpp($2, $(NF-2), base_)
}

function rosidl_typesupport_fastrtps_c(pkg, dir, base)
{
    if (!generator("rosidl_typesupport_fastrtps_c")) return

    generated["include", pkg, pkg, "msg",
              "rosidl_typesupport_fastrtps_c__visibility_control.h"]

    generated["include", pkg, pkg, dir,
             "detail", base "__rosidl_typesupport_fastrtps_c.h"]
}

function rosidl_typesupport_fastrtps_cpp(pkg, dir, base)
{
    if (!generator("rosidl_typesupport_fastrtps_cpp")) return

    generated["include", pkg, pkg, "msg",
              "rosidl_typesupport_fastrtps_cpp__visibility_control.h"]

    generated["include", pkg, pkg, dir,
              "detail", base "__rosidl_typesupport_fastrtps_cpp.hpp"]
    generated["@pkgdir include", pkg, pkg, dir, "detail", "dds_fastrtps"]
}
