if (global.CurrentLevel == 1 && !instance_exists(obj_transition))
{
	draw_helps_move();
	draw_helps_jump();
	draw_helps_enemyHit();
}
else if (global.CurrentLevel == 3 && !instance_exists(obj_transition))
{
	draw_helps_doubleJump();
	draw_helps_crushBlocks();
}
else if (global.CurrentLevel == 6 && !instance_exists(obj_transition))
{
	draw_helps_wallJump();
}