#macro FRAME_RATE 60
#macro TILE_SIZE 16
//this divides de 360 degrees into 4 cardinal positions 
//as 0,1,2,3 (0-90,90-180,180-270,270-360)
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START rProcedural

#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32
#macro FLOOR -5
#macro WALL -6
#macro VOID -7

#macro NORTH 1
#macro WEST 2
#macro EAST 4
#macro SOUTH 8