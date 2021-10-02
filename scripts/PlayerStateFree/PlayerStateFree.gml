// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * wlkSpeed, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * wlkSpeed, inputDirection);

	PlayerCollision();


	//Update Sprite Index
	var _oldSprite = sprite_index;

	if(inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}
	else sprite_index = spriteIdle;


	//If it change sprite, local frame of the animation strip to 0 
	if(_oldSprite != sprite_index) localFrame = 0;

	//Update image_index
	PlayerAnimateSprite();
	
	//if the activate key is pressed then roll
	if(keyActivate)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = rollDistance;
	}
		

}