randomize();

global.iCamera = instance_create_layer(0, 0, layer, oCamera);

var _col_map_id = layer_tilemap_get_id("Col");
var _water_map_id = layer_tilemap_get_id("WaterTiles");

var _lay_ground_0_id = layer_get_id("Ground_0");
var _ground_0_map_id = layer_tilemap_get_id(_lay_ground_0_id);

var _lay_ground_1_id = layer_get_id("Ground_1");
var _ground_1_map_id = layer_tilemap_get_id(_lay_ground_1_id);

var _lay_trees_id = layer_get_id("Trees");
var _trees_map_id = layer_tilemap_get_id(_lay_trees_id);

var _possibleObjects = [oTree, oBushes];


// LLAMADA AL SCRIPT
WorldGeneration();





