if (global.IsPause) exit;

if (durability <= 0)
	destroy = true;
	
if (destroy)
	layer_sequence_create("Traps", x, y, seq_destroy_block);