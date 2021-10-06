randomize();

//get tiles layer map
var _wall_map_id = layer_tilemap_get_id("WallTiles");

//var _grass_patch_map_id = layer_tilemap_get_id("HighGrassLayer");

var _ground_0_map_id = layer_tilemap_get_id("Ground_0");

var _ground_1_map_id = layer_tilemap_get_id("Ground_1");

//set up grid

_width = room_width div CELL_WIDTH;
_heigth = room_height div CELL_HEIGHT;
_grid = ds_grid_create(_width, _heigth);

ds_grid_set_region(_grid, 0 ,0 ,_width, _heigth, VOID);

//create controller

var _controller_x = _width div 2;
var _controller_y = _heigth div 2;
var _controller_direction = irandom(3);
var _steps = 200000;

var _direction_change_odds = 1;

//repeat(_steps) {
//	_grid[# _controller_x, _controller_y] = FLOOR;
	
//	//Randomize the direction
//	if(irandom(_direction_change_odds) == _direction_change_odds)
//	{
//		_controller_direction = irandom(3);
//	}
	
//	//move the controller
//	var _x_direction = lengthdir_x(1, _controller_direction * 90);
//	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	
//	_controller_x += _x_direction;
//	_controller_y += _y_direction;
	
//	//make sure we dont go outside of grid
//	if(_controller_x < 2 || _controller_x >= _width -2)
//	{
//		_controller_x += -_x_direction * 2;
//	}
	
//	if(_controller_y < 2 || _controller_y >= _heigth -2)
//	{
//		_controller_y += -_y_direction * 2;
//	}
		
//}


for(var _y = 1; _y < _heigth -1; _y++)
{
	for(var _x = 1; _x < _width - 1; _x++)
	{
		tilemap_set(_ground_0_map_id, irandom(15) + 1,_x,_y);
		
		var _chances =	 0;
		var _north_ground_1 = tilemap_get(_ground_1_map_id, _x, _y -1);
		var _west_ground_1 = tilemap_get(_ground_1_map_id, _x - 1, _y);
		var _east_ground_1 = tilemap_get(_ground_1_map_id, _x + 1, _y);
		var _south_ground_1 = tilemap_get(_ground_1_map_id, _x, _y +1);
		
		if(_north_ground_1 || _west_ground_1 || _east_ground_1 || _south_ground_1)
		{
			_chances = random_range(7,9);
		}
		else
		{
			_chances = random_range(0,9);
		}
		
		if(_chances > 8)
		{
			tilemap_set(_ground_1_map_id, irandom(15) + 1,_x,_y);
		}
		
		//if(_grid[# _x,_y] != FLOOR)
		//{
		//	var _north_tile = _grid[# _x,_y -1] == VOID;	
		//	var _west_tile = _grid[# _x - 1,_y] == VOID;
		//	var _east_tile = _grid[# _x + 1,_y] == VOID;
		//	var _south_tile = _grid[# _x,_y + 1] == VOID;
			
		//	var _tile_index = NORTH * _north_tile + WEST * _west_tile + EAST * _east_tile + SOUTH * _south_tile + 1;
			
		//	//if its a wall
		//	if (_tile_index == 1)
		//	{
		//		_grid[# _x,_y] = FLOOR;
		//	}
		//	else
		//	{
		//		if(_tile_index == 16)
		//		{
		//			tilemap_set(_grass_patch_map_id, irandom(3) + 1,_x,_y);
		//		}
		//		else
		//		{
		//			tilemap_set(_wall_map_id, _tile_index, _x, _y);
		//		}	
				
		//	}
				
		//}
	}
}














