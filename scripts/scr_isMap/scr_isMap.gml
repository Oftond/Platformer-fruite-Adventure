function isMap(argument0) {
	gml_pragma("forceinline");

	if (not is_undefined(argument0)) {
	    if (ds_exists(argument0, ds_type_map)) {
	        return true;
	    } else {
	        return false;
	    }
	} else {
	    return false;
	}
}