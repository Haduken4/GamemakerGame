
if(SpawnRate <= 0)
{
	var AmountToSpawn = round(EnemyDeathCount / 10) + 3;

	with(WaveCounter)
	{
		CurrentWave += 1;
	}

	if(AmountToSpawn < 3)
	{
		AmountToSpawn = 3;
	}



	var i = 0;
	var Boolean = true;

	while(Boolean)
	{
		var RandomX = x + random_range(-500, 500);
	
		instance_create_layer(RandomX, y, "EnemyLayer", BasicEnemyPrototype)
	
		i += 1;
	
		if(i >= AmountToSpawn)
		{
			Boolean = false;
		}
	
	}
	
	SpawnRate = 500;
}


SpawnRate -= 1;