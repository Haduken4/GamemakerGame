
//Moving
if(keyboard_check(ord("D")))
{
	if(x < room_width)
	{
		x += 6;
	}
	
	
	//if the player is moving sideways we want to change their angle accordingly unless they are strafing
	if(!keyboard_check(ord("A"))) && (!keyboard_check(vk_space))
	{
		if(direction > BaseDirection + 330) || (direction <= 30)
		{
			direction -= 3;
		}
		image_angle = direction;
	}
}
if(keyboard_check(ord("W")))
{
	if(y > 132)
	{
		y -= 5;
	}
}
if(keyboard_check(ord("A")))
{
	if(x > 0)
	{
		x -= 6;
	}
	
	//if the player is moving sideways we want to change their angle accordingly unless they are strafing
	if(!keyboard_check(ord("D"))) && (!keyboard_check(vk_space))
	{
		if(direction < BaseDirection + 30) || (direction >= 330)
		{
			direction += 3;
		}
		image_angle = direction;
	}
}
if(keyboard_check(ord("S")))
{
	if(y < room_height - 76)
	{
		y += 5;
	}
}
//if space is being pressed we want to allow the player to strafe
if(!keyboard_check(vk_space))
{
	// if the player is pressing both the D and A key (or is not pressing either)
	// we want to return the player to the base direction
	if(!keyboard_check(ord("D"))) && (!keyboard_check(ord("A")))
	{
		if(direction >= 330) && (direction != BaseDirection)
		{
			direction += 3;
		}
		else if(direction <= 30) && (direction != BaseDirection)
		{
			direction -= 3;
		}
		else
		{
			direction =  BaseDirection;
		}
		image_angle = direction;
		
	}
	if(keyboard_check(ord("D"))) && (keyboard_check(ord("A")))
	{
		if(direction >= 330) && (direction != BaseDirection)
		{
			direction += 3;
		}
		else if(direction <= 30) && (direction != BaseDirection)
		{
			direction -= 3;
		}
		else
		{
			direction =  BaseDirection;
		}
		image_angle = direction;
		
		
	}
}


//Shooting
if(mouse_check_button(mb_left)) && (ShotCooldown <= 0) && (!Shotgun)
{	//calculate the angle of the bullet we are firing	
	var bulletDirection = direction + 90;

	bulletDirection += random_range(-4, 4);
	// spawn a bullet and store it as a variable to edit its angle
	var bullet = instance_create_layer(x, y, "BulletLayer", BasicBullet);
	bullet.direction = bulletDirection;
	bullet.image_angle = bulletDirection;
	ShotCooldown = irandom_range(2, 4);
}
if(mouse_check_button(mb_left)) && (ShotCooldown <= 0) && (Shotgun)
{
	// store the starting angle for the first bullet
	var tempAngle = -18;
	// loop through the amount of times you want to spawn a bullet
	for(var i = 0; i < 5; ++i)
	{
		//calculate the angle of the bullet we are firing	
		var shotgunBulletDirection = direction + 90 + tempAngle + random_range(-1, 1);
		// spawn a bullet and store it as a variable to edit its angle
		var Bullet = instance_create_layer(x, y, "BulletLayer", BasicBullet);
		Bullet.direction = shotgunBulletDirection;
		Bullet.image_angle = shotgunBulletDirection;
		tempAngle += 9;
	}
	ShotCooldown = irandom_range(12, 16);
}
if(keyboard_check_pressed(vk_shift))
{
	if(Shotgun)
	{
		Shotgun = false;
	}
	else
	{
		Shotgun = true;
	}
}

if(Health <= 0)
{
	game_restart();
}
//decrement the shotcooldown so we can shoot
ShotCooldown -= 1;