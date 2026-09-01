if (ds_exists(collision_list, ds_type_list)) {
    ds_list_destroy(collision_list);
}
if (ds_exists(hitbox_list, ds_type_list)) {
    ds_list_destroy(hitbox_list);
}
