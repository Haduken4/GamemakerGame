if(BasicEnemySpawnerPrototype.Won == true)
{
	if(SpawnTimer <= 0)
	{
		var RandomDirection = random_range(0, 45);
		var RandomX = x + random_range(-300, 300);
		var RandomY = y + random_range(-50, -200);
		var RandomScale = random_range(0.9, 1.5);
		
		var SpawnedFirework = instance_create_layer(RandomX, RandomY, layer, FireworkObject);
		
		SpawnedFirework.direction = RandomDirection;
		SpawnedFirework.image_angle = SpawnedFirework.direction;
		SpawnedFirework.image_xscale = RandomScale;
		SpawnedFirework.image_yscale = RandomScale;
		
		SpawnTimer = random_range(20, 30);
	}
	
	SpawnTimer -= 1;
}