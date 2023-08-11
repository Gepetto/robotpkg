# interfaces/ros2-rosidl/files/adapter.awk
#                                           Anthony Mallet on Thu Aug 17 2023
#

# See interfaces/ros2-rosidl/files/plist-generator.awk for details

$1 == "share" && $NF == "msg" { NF--; msg[$0]; next }
$1 == "share" && $NF == "srv" { NF--; srv[$0]; next }

END {
    f = ""

    if (generator("rosidl_cmake<4.3")) {
        # split request/response messages are not considered as msg
        for(f in srv) {
            generated[f "_Request.msg"]; generated[f "_Response.msg"];
            delete msg[f "_Request"]; delete msg[f "_Response"];
        }
    }

    for(f in msg) { plist[f ".msg"]; generated[f ".idl"] }
    for(f in srv) { plist[f ".srv"]; generated[f ".idl"] }

    if (f) plist["@comment filtered by rosidl adapter.awk"]
}
