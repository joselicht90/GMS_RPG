/// @description Update Camera
// You can write your code in this editor

//update destination
if(instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update Object Position
x += (xTo - x) * 0.5;
y += (yTo - y) * 0.5;

//keep camera center inside room bounds
x = clamp(x, halfWidthView, room_width - halfWidthView);
y = clamp(y, halfHeightView, room_height - halfHeightView);

//Screenshake

x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1 / shakeLenght) * shakeMagnitude));

camera_set_view_pos(cam, x - halfWidthView, y - halfHeightView);