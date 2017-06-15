if(y < StartingY + 300)
{
	y += YMoveSpeed;
}
else
{
	if(XBoolean)
	{
		x += XMoveSpeed;
		if(x >= room_width - 96)
		{
			XBoolean = !XBoolean;
			XMoveSpeed -= 0.5;
		}
		if(XMoveSpeed != 1.3)
		{
			XMoveSpeed += 0.01;
		}
	}
	else
	{
		x -= XMoveSpeed;
		if(x <= 96)
		{
			XBoolean = !XBoolean;
			XMoveSpeed -= 0.5
		}
		if(XMoveSpeed != 1.3)
		{
			XMoveSpeed += 0.01;
		}
	}
	
	
}


if(Health <= 0)
{
	with(BasicEnemySpawnerPrototype)
	{
		EnemyDeathCount += 5;
	}
	
	instance_create_layer(x, y, "PickupLayer", HealthPickupObject);

	instance_destroy();
}

if(AttackSpeed1 <= 0)
{
	var bulletDirection = point_direction(x, y, PlayerShip.x, PlayerShip.y);
	
	bulletDirection += random_range(-4, 4);
	// spawn a bullet and store it as a variable to edit its angle
	var bullet = instance_create_layer(x, y, "EnemyBulletLayer", BasicEnemyBullet);
	bullet.direction = bulletDirection;
	bullet.image_angle = bulletDirection;
	AttackSpeed1 = irandom_range(25, 35);
}

if(AttackSpeed2 <= 0)
{
	// store the starting angle for the first bullet
	var ShotgunBullets = choose(5, 5, 5, 3, 3, 7);
	var tempAngle = 0;
	if(ShotgunBullets == 3)
	{
		tempAngle = -12;
	}
	else if(ShotgunBullets == 5)
	{
		tempAngle = -24;
	}
	else
	{
		tempAngle = -36;
	}
	// loop through the amount of times you want to spawn a bullet
	for(var i = 0; i < ShotgunBullets; ++i)
	{
		//calculate the angle of the bullet we are firing	
		var shotgunBulletDirection = point_direction(x, y, PlayerShip.x, PlayerShip.y) + tempAngle + random_range(-1, 1);
		// spawn a bullet and store it as a variable to edit its angle
		var Bullet = instance_create_layer(x, y, "EnemyBulletLayer", BasicEnemyBullet);
		Bullet.direction = shotgunBulletDirection;
		Bullet.image_angle = shotgunBulletDirection;
		tempAngle += 12;
	}
	AttackSpeed2 = irandom_range(80, 100);
}


if(y > room_height + 48)
{
	with(BasicEnemySpawnerPrototype)
	{
		EnemyDeathCount += 10;
	}

	instance_destroy();
}

--AttackSpeed1;
--AttackSpeed2;
