y += MoveSpeed;


if(Health <= 0)
{
	with(BasicEnemySpawnerPrototype)
	{
		EnemyDeathCount += 1;
	}

	instance_destroy();
}

if(AttackSpeed <= 0)
{
	if(Shotgun != 1)
	{
		var bulletDirection = point_direction(x, y, PlayerShip.x, PlayerShip.y);

		bulletDirection += random_range(-4, 4);
		// spawn a bullet and store it as a variable to edit its angle
		var bullet = instance_create_layer(x, y, "EnemyBulletLayer", BasicEnemyBullet);
		bullet.direction = bulletDirection;
		bullet.image_angle = bulletDirection;
		AttackSpeed = irandom_range(50, 60);
	}
	else
	{
			// store the starting angle for the first bullet
		var tempAngle = -9;
		// loop through the amount of times you want to spawn a bullet
		for(var i = 0; i < 3; ++i)
		{
			//calculate the angle of the bullet we are firing	
			var shotgunBulletDirection = point_direction(x, y, PlayerShip.x, PlayerShip.y) + tempAngle + random_range(-1, 1);
			// spawn a bullet and store it as a variable to edit its angle
			var Bullet = instance_create_layer(x, y, "EnemyBulletLayer", BasicEnemyBullet);
			Bullet.direction = shotgunBulletDirection;
			Bullet.image_angle = shotgunBulletDirection;
			tempAngle += 9;
		}
		AttackSpeed = irandom_range(120, 140);
	}
}

if(y > room_height + 48)
{
	with(BasicEnemySpawnerPrototype)
	{
		EnemyDeathCount += 10;
	}

	instance_destroy();
}

--AttackSpeed;
