

if(keyboard_check_pressed(ord("P")))
{
	if(!Paused)
	{
		instance_deactivate_all(true);
		
		Paused = !Paused;
	}
	else
	{
		instance_activate_all();
		Paused = !Paused;
	}
	
}