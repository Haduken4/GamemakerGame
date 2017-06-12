if(Health <= 1)
{
	draw_sprite_ext(Texture_PlayerShipPrototypeDamaged, image_index, x, y, image_xscale, image_yscale, direction, c_white, 1);
}
else
{
	draw_self();
}