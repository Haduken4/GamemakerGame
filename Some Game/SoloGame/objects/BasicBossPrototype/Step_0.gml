y += MoveSpeed;


if(Health <= 0)
{
	with(BasicEnemySpawnerPrototype)
	{
		EnemyDeathCount += 1;
	}

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
		
	var tempAngle = 0;
	if(ShotgunBullets == 3)
	{
		tempAngle = -9;
	}
	else if(ShotgunBullets == 5)
	{
		tempAngle = -18;
	}
	else
	{
		tempAngle = -27;
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
		tempAngle += 9;
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
