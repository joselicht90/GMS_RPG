//initial step of the player
state = PlayerStateFree;

//get the id of the tilemap of the tile layer
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

//stop animation
image_speed = 0;

//axis speed otherwise it would move
//constantly in the axis
hSpeed = 0;
vSpeed = 0;

//walking speed
//this will multiples the movement later
wlkSpeed = 2.0;

//speed when rolling
rollSpeed = 3.0;
//i selected this distance randomly
rollDistance = 50;

//Sprites references
spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

