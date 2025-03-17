if (global.CurrentHP == global.MaxHP) exit;
instance_destroy(self);
other.heal(recover_hp);
var _parts = part_system_create_layer("GUI", false, Ps_Explosion_Heart);
part_system_position(_parts, x, y);