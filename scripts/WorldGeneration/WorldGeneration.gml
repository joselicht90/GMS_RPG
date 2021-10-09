// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WorldGeneration(){
	//-------------- DAR BOLA DESDE ACA ------------------------

	//-- LO QUE ESTA EN ROJO ESTA DECLARADO EN EL ARCHIVO MACROS DE LA CARPETA SCRIPTS (ES COMO CONSTANTES GLOBALES)

	//DIVIDO EL ANCHO DEL ROOM (NIVEL DIGAMOS) POR EL ANCHO DE LAS CELDAS (USAMOS 32x32)
	_width = room_width div CELL_WIDTH;
	_heigth = room_height div CELL_HEIGHT;

	//CREO UNA GRILLA
	_grid = ds_grid_create(_width, _heigth);

	//LA LLENO DE PRINCIPIO A FIN CON UN VALOR VOID (-7, PORQUE CONVENIA VALOR NEGATIVO Y PUEDO USAR DESDE -5)
	ds_grid_set_region(_grid, 0 ,0 ,_width, _heigth, VOID);

	//CANTIDAD DE REPETICIONES DE ELEGIR UN PUNTO EN LA GRILLA Y LLENARLO
	var _steps = 10000;

	//LOS BIOMAS ESTAN DECLARADOS EN MACROS PERO SIGUEN UN ORDEN
	// - LLANURA
	// - PLAIN
	// - BOSQUE
	// - MONTANA
	// - DESIERTO
	// TENGO UN ARRAY DE ARRAYS. EL PRIMER NIVEL CORRESPONDE AL BIOMA DE LA SEED, EL SEGUNDO LA PROBABILIDAD DE LOS OTROS BIOMAS
	// LOS ESCRIBO COMO SUMA DE LA PROBABILIDAD ANTERIORES PORQUE LA PROBABILIDAD LA CALCULO CON UN NUMERO RANDOM ENTRE 1 Y 100
	var _probs_biomes = [[0,40,70,90,99,100],[0,20,50,70,90,100],[0,10,30,80,99,100],[0,10,20,30,80,100],[0,10,11,12,42,100]];

	//ELIGO LA SEED
	var _seed = random_range(5,9);

	// AGARRO LAS PROBABILIDADES DE ESA SEED
	var _seed_probs = _probs_biomes[_seed - array_length(_probs_biomes)];


	// PODEMOS HACERLO DE 2 MANERAS, CON REPETICIONES O CHEQUEANDO SI LA GRILLA TIENE ALGUN VACIO
	// DE LA PRIMER MANERA PODEMOS LLEGAR A TENER VACIOS PERO ES MAS RAPIDA.
	//while (ds_grid_get_min(_grid,1,1,_width - 1, _heigth - 1) < -7)
	repeat(_steps)
	{
		//AGARRAMOS COORDENADAS RANDOM X:Y
		var _random_x = irandom_range(1, _width- 1);
		var _random_y = irandom_range(1, _heigth -1); 
	
	
		//SI DONDE NOS PARAMOS ES VACIO (ESTA CONDICION PODRIA SACARSE ????)
		if(_grid[# _random_x, _random_y] == VOID)
		{
			//AGARRAO UN VALOR RANDOM ENTRE 1 Y 100
			var _biome_value = irandom_range(1,100);
		
			//BIOMA SELECCIONADO
			var _biome_selected = -1; 
		
			//LA EXTENSION DESDE EL CENTRO QUE TENDRA EL BIOMA, CON UN MINIMO QUE SETEAMOS NOSOTROS
			var _extension = 20;
		
			var _i = 1;
		
			//MIENTRAS NO SELECCIONE UN BIOMA ITERO
			while(_biome_selected < 0)
			{
				//SI EL NUMERO RANDOM ESTA ENTRE MI PROBABILIDAD Y LA DEL ANTERIOR ENTONCES ES MI BIOMA
				if(_biome_value <= _seed_probs[_i] && _biome_value > _seed_probs[_i-1])
				{
					// SETTEO EL BIOMA COMO SELECCIONADO (RESTO 1 PORQUE EL PRIMER VALOR ES 0)
					_biome_selected = _i + CANTIDAD_BIOMAS - 1;
					// AUMENTO LA EXTENSION EN UN VALOR IGUAL A LA PROBABILIDAD (SE PUEDE HACER OTRO ALGORITMO PARA ESTO)
					_extension += _seed_probs[_i] - _seed_probs[_i-1];
				}
			
				_i+=1;
			}
		
			// UNA VEZ SELECCIONADO EL BIOMA SETEO EL PUNTO DONDE CAI
			_grid[# _random_x, _random_y] = _biome_selected;
			
			// SETEO LA REGION USANDO LA EXTENSION Y ASEGURANDOME QUE LA REGION NO PUEDA PASAR
			// DE LOS MARGENES QUE DEFINIMOS
			ds_grid_set_region(_grid, max(1,round(_random_x - _extension div 2)),max(round(_random_y - _extension div 2)),min(_width-1, round(_random_x + _extension div 2)),min(_heigth-1, round(_random_y + _extension div 2)), _biome_selected);
		
		}
	
	}




	// AHORA PASAMOS POR LA GRILLA Y VAMOS SETEANDO EL TILE
	for(var _y = 1; _y < _heigth -1; _y++)
	{
		for(var _x = 1; _x < _width - 1; _x++)
		{
		
			// TILEMAPS POSIBLES CON EL MISMO ORDEN QUE LOS BIOMAS EN EL ARRAY
			var _tile_map_id = [layer_tilemap_get_id("llanura"),layer_tilemap_get_id("plain"), layer_tilemap_get_id("bosque"), layer_tilemap_get_id("montana"), layer_tilemap_get_id("desierto")];
		
			// EL BIOMA ES EL VALOR DE LA GRILLA
			var _cell_biome = _grid[# _x,_y];
		
			// SI NO ES VACIO
			if(_cell_biome != VOID)
			{
				// SELECCION EL TILE DEL BIOMA CORRESPONDIENTE
				tilemap_set(_tile_map_id[_cell_biome - CANTIDAD_BIOMAS], 1,_x,_y);
			}
			
			
	// ------------------------- NO DAR BOLA A PARTIR DE ACA -------------------------------------------------------
		
			////Ground 0 Layer population
			//tilemap_set(_ground_0_map_id, irandom(15) + 1,_x,_y);
		
			////Ground 1 Layer population
			//var _chancesGround1 = random_range(0,9);
			//var _north_ground_1 = tilemap_get(_ground_1_map_id, _x, _y -1);
			//var _north_west_ground_1 = tilemap_get(_ground_1_map_id, _x-1, _y -1);
			//var _north_east_ground_1 = tilemap_get(_ground_1_map_id, _x+1, _y -1);
			//var _west_ground_1 = tilemap_get(_ground_1_map_id, _x - 1, _y);
			//var _east_ground_1 = tilemap_get(_ground_1_map_id, _x + 1, _y);
			//var _south_ground_1 = tilemap_get(_ground_1_map_id, _x, _y +1);
			//var _south_west_ground_1 = tilemap_get(_ground_1_map_id, _x-1, _y +1);
			//var _south_east_ground_1 = tilemap_get(_ground_1_map_id, _x+1, _y +1);
		
			//if(_north_ground_1 || _west_ground_1 || _east_ground_1 || _south_ground_1 )
			//{
			//	_chancesGround1 = random_range(5,9);
			//}
		
			//if(_chancesGround1 > 7)
			//{
			//	tilemap_set(_ground_1_map_id, irandom(15) + 1,_x,_y);
			//}
		
			////Trees population
		
			//var _chancesTrees = random_range(0,99);
		
			//if(_chancesTrees > 98 && tilemap_get_at_pixel(_water_map_id, _x, _y) == 0)
			//{
			//	tilemap_set(_trees_map_id, 1,_x,_y);
			//	instance_create_layer(_x * (CELL_WIDTH / 2) + (CELL_WIDTH / 4), _y * (CELL_HEIGHT / 2) + ( CELL_HEIGHT / 2 ), layer, _possibleObjects[irandom(1)]);
			
			//}
		
		
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
			//		tilemap_set(_ground_0_map_id, irandom(15) + 1,_x,_y);
			//	}
			//	else
			//	{
			//			//tilemap_set(_col_map_id, 1, _x, _y);
			//			tilemap_set(_water_map_id, _tile_index, _x, _y);
			//	}
				
			//}
			//else
			//{
			//	tilemap_set(_ground_0_map_id, irandom(15) + 1,_x,_y)
			//}
		}
	}

}