if (durability <= 0)
	destroy = true;
	
if (destroy)
	layer_sequence_create("Instances", x, y, seq_destroy_block);