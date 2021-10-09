// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FloraCollision(){
	var inst;
	
	inst = collision_rectangle(x - (sprite_width/2), y - (sprite_height), x + (sprite_width/2), y, oPlayer, false, true);
	if (inst != noone)
	{
	    image_alpha=0.5;
	}
	else
	{
		image_alpha = 1;
	}
}