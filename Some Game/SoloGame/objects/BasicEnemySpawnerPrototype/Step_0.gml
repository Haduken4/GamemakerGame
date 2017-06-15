

if(Wave < 40)
{
	if(SpawnRate <= 0)
	{
		with(WaveCounter)
		{
			CurrentWave += 1;
		}
	
		Wave += 1;
		var AmountToSpawn = round(EnemyDeathCount / 10) + 3;

	
		if(AmountToSpawn < 3)
		{
			AmountToSpawn = 3;
		}

		if(Wave mod 15 == 0)
		{
			var RandomX = x + random_range(-100, 100);
			var RandomY = y + random_range(-30, 30);
	
			instance_create_layer(RandomX, RandomY, "EnemyLayer", BasicBossPrototype)
		
			AmountToSpawn -= 12;
		}

		var i = 0;
		var Boolean = true;

		while(Boolean)
		{
			var RandomX = x + random_range(-500, 500);
			var RandomY = y + random_range(-30, 30);
	
			instance_create_layer(RandomX, RandomY, "EnemyLayer", BasicEnemyPrototype)
	
			i += 1;
	
			if(i >= AmountToSpawn)
			{
				Boolean = false;
			}
	
		}
	
	
		SpawnRate = 500 + EnemyDeathCount * 2 + Wave;
	


	}
}



SpawnRate -= 1;