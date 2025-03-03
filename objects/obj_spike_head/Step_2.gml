if (wait_timer > 0)
{
	wait_timer--;
	move_x = 0;
	move_y = 0;
	exit;
}

switch(dir)
{
	case DIRECTIONS.LEFT:
		move_x -= move_spd;
		move_y = 0;
	break;
	
	case DIRECTIONS.TOP:
		move_y -= move_spd;
		move_x = 0;
	break;
	
	case DIRECTIONS.RIGHT:
		move_x += move_spd;
		move_y = 0;
	break;
	
	case DIRECTIONS.BOTTOM:
		move_y += move_spd;
		move_x = 0;
	break;
}

if (move_x < -max_move_spd)
	move_x = -max_move_spd;
else if (move_x > max_move_spd)
	move_x = max_move_spd;
else if (move_y > max_move_spd)
	move_y = max_move_spd;
else if (move_y < -max_move_spd)
	move_y = -max_move_spd;

switch(mode)
{
	case 0:
		change_all_dir();
	break;
	
	case 1:
		change_horizontal_dir();
	break;
	
	case 2:
		change_vertical_dir();
	break;
}

x += move_x;
y += move_y;