// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){

	//movement
	hSpeed = lengthdir_x(rollSpeed, direction);
	vSpeed = lengthdir_y(rollSpeed, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - rollSpeed);
	
	//we store if we are colliding
	var _collided = PlayerCollision();
	
	//change sprite
	sprite_index = spriteRoll;
	
	//rememeber, each sprite strip has 4 directions, so to get
	//the total number of frames of each directions...
	var _totalFrames = sprite_get_number(sprite_index)/4;
	
	//this if to fit the roll animation into our movement
	//no matter the rollSpeed or the rollDistance we set
	//the whole animation of rolling will fit
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / rollDistance))* _totalFrames), _totalFrames - 1);
	
	//change state
	if(moveDistanceRemaining <= 0) state = PlayerStateFree;
	
	//shake if collided
	if(_collided)
	{
		state = PlayerStateFree;
		ScreenShake(1, 20);
	}
}