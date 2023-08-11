# interfaces/ros2-rosidl/files/plist-generator.mk
#                                           Anthony Mallet on Thu Aug 17 2023
#

# See interfaces/ros2-rosidl/files/plist-generator.awk for details
END {
    if (rosidl_generator)
        plist["@comment filtered by rosidl generator.awk"]
}

NF > 3 && $1 == "share" && $NF == "idl" {
    rosidl_generator = 1
    rosidl_generator_type_description($2, $(NF-2), $(NF-1))

    base_ = decamel($(NF-1))
    rosidl_generator_c($2, $(NF-2), base_)
    rosidl_generator_cpp($2, $(NF-2), base_)
    rosidl_typesupport_introspection_c($2, $(NF-2), base_)
    rosidl_typesupport_introspection_cpp($2, $(NF-2), base_)
}

function rosidl_generator_type_description(pkg, dir, base)
{
    if (!generator("rosidl_generator_type_description")) return
    generated["share", pkg, dir, base ".json"]
}

function rosidl_generator_c(pkg, dir, base)
{
    if (!generator("rosidl_generator_c")) return

    generated["include", pkg, pkg, "msg",
              "rosidl_generator_c__visibility_control.h"]

    generated["include", pkg, pkg, dir, base ".h"]
    generated["include", pkg, pkg, dir, "detail", base "__functions.h"]
    generated["include", pkg, pkg, dir, "detail", base "__functions.c"]
    generated["include", pkg, pkg, dir, "detail", base "__struct.h"]
    generated["include", pkg, pkg, dir, "detail", base "__type_support.h"]

    if (generator("rosidl_generator_c<4")) return

    generated["include", pkg, pkg, dir, "detail", base "__description.c"]
    generated["include", pkg, pkg, dir, "detail", base "__type_support.c"]
}

function rosidl_generator_cpp(pkg, dir, base)
{
    if (!generator("rosidl_generator_cpp")) return

    generated["include", pkg, pkg, dir, base ".hpp"]
    generated["include", pkg, pkg, dir, "detail", base "__builder.hpp"]
    generated["include", pkg, pkg, dir, "detail", base "__struct.hpp"]
    generated["include", pkg, pkg, dir, "detail", base "__traits.hpp"]

    if (generator("rosidl_generator_cpp<4.2")) return

    generated["include", pkg, pkg, dir, "detail", base "__type_support.hpp"]

    generated["include", pkg, pkg, "msg",
              "rosidl_generator_cpp__visibility_control.hpp"]
}

function rosidl_typesupport_introspection_c(pkg, dir, base)
{
    if (!generator("rosidl_typesupport_introspection_c")) return

    generated["include", pkg, pkg, "msg",
              "rosidl_typesupport_introspection_c__visibility_control.h"]

    generated["include", pkg, pkg, dir,
              "detail", base "__rosidl_typesupport_introspection_c.h"]

    # not sure sure why this belongs here, as this is redundant with
    # rosidl_generator_c>=4. Hopefully, the content is synced somehow?
    generated["include", pkg, pkg, dir, "detail", base "__type_support.c"]
}

function rosidl_typesupport_introspection_cpp(pkg, dir, base)
{
    if (!generator("rosidl_typesupport_introspection_cpp")) return

    generated["include", pkg, pkg, dir,
              "detail", base "__rosidl_typesupport_introspection_cpp.hpp"]
    generated["include", pkg, pkg, dir, "detail", base "__type_support.cpp"]
}
