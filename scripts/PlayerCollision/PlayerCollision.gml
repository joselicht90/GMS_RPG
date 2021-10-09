// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	
	//when you write a variable as VAR it only last for this frame.
	var _collision = false;
	
	
	//horizontal tiles
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		//this makes the player move until it hit the wall
		//if the movement is 18 pixels, but the player is
		//at 16 pixel of coliding, it will only move 16 pixels.
		x -= x mod TILE_SIZE;
		if(sign(hSpeed) == 1) x += TILE_SIZE - 1;
		
		
		hSpeed = 0;
		_collision = true;
	}
	//horizontal move commit
	x += hSpeed;

	//vertical tiles
	if(tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		//this makes the player move until it hit the wall
		//if the movement is 18 pixels, but the player is
		//at 16 pixel of coliding, it will only move 16 pixels.
		y -= y mod TILE_SIZE;
		if(sign(vSpeed) == 1) y += TILE_SIZE - 1;
		
		vSpeed = 0;
		_collision = true;
	}
	
	//vertical move commit
	y += vSpeed;
	
	
	return _collision;
}