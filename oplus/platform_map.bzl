_platform_map = {
    "canoe": {
        "dtb_list": [
            # keep sorted
            {"name": "canoe.dtb"},
            {
                "name": "canoep.dtb",
                "apq": True,
            },
            {
                "name": "canoep-tp.dtb",
                "apq": True,
            },
            {
                "name": "canoep-tp-v2.dtb",
                "apq": True,
            },
            {
                "name": "canoep-v2.dtb",
                "apq": True,
            },
            {"name": "canoe-tp.dtb"},
            {"name": "canoe-tp-v2.dtb"},
            {"name": "canoe-v2.dtb"},
        ],
        "dtbo_list": [
            # keep sorted
            {"name": "infiniti-24831-canoe-overlay.dtbo"},
            {"name": "infiniti-24863-canoe-overlay.dtbo"},
        ],
    },
    "alor-interposer": {
        "dtb_list": [
            # keep sorted
            {"name": "alor-interposer.dtb"},
            {"name": "alor-interposer-v2.dtb"},
        ],
        "dtbo_list": [
            # keep sorted
        ],
    },
}

def _get_dtb_lists(target, dt_overlay_supported):

    ret = {
        "dtb_list": [],
        "dtbo_list": [],
    }

    if not target in _platform_map:
        print("WRNING: {} not in device tree platform map!".format(target))
        return ret

    for dtb_node in [target] + _platform_map[target].get("binary_compatible_with", []):
        ret["dtb_list"].extend(_platform_map[dtb_node].get("dtb_list", []))
        if dt_overlay_supported:
            ret["dtbo_list"].extend(_platform_map[dtb_node].get("dtbo_list", []))
        else:
            # Translate the dtbo list into dtbs we can append to main dtb_list
            for dtb in _platform_map[dtb_node].get("dtb_list", []):
                dtb_base = dtb["name"].replace(".dtb", "")
                for dtbo in _platform_map[dtb_node].get("dtbo_list", []):
                    if not dtbo.get("apq", True) and dtb.get("apq", False):
                        continue

                    dtbo_base = dtbo["name"].replace(".dtbo", "")
                    ret["dtb_list"].append({"name": "{}-{}.dtb".format(dtb_base, dtbo_base)})

    return ret

def get_dtb_list(target, dt_overlay_supported = True):
    return [dtb["name"] for dtb in _get_dtb_lists(target, dt_overlay_supported).get("dtb_list", [])]

def get_dtbo_list(target, dt_overlay_supported = True):
    return [dtb["name"] for dtb in _get_dtb_lists(target, dt_overlay_supported).get("dtbo_list", [])]
