if (global.CurrentHP == global.MaxHP || global.IsPause) exit;
instance_destroy(self);
other.heal(recover_hp);
global.HeartsParts = part_system_create_layer("SFX", false, Ps_Explosion_Heart);
part_system_position(global.HeartsParts, x, y);