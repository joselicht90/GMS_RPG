/// @description Set up camera
// You can write your code in this editor

//camera instance
cam = view_camera[0];

//who the camera is following
follow = oPlayer;

//the center of viewport to center our player in cam
halfWidthView = camera_get_view_width(cam) * 0.5;
halfHeightView = camera_get_view_height(cam) * 0.5;

//where the camera should go
xTo = xstart;
yTo = ystart;

shakeLenght = 0;
shakeMagnitude = 0;
shakeRemain = 0;
