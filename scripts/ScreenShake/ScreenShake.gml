// @desc Screenshake(magnitude, frames)
// @arg Magnitued: the strength of the shake
// @arg Frames: the lenght of the shake
function ScreenShake(magnitude, frames){
	
	with(global.iCamera)
	{
		if(magnitude > shakeRemain)
		{
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLenght = frames;
		}
	}
	
}