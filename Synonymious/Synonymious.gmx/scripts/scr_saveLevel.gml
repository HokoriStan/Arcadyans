var level = argument0;

if (!ds_map_exists(Game.dataMap,"Level "+string(level))
{
    ds_map_add(Game.dataMap,"Level "+string(level)+,true);
    var encodedMap = json_encode(map);
    var hash = md5_string_utf8(encodedMap);
    
    var file = file_text_open_write("Data.txt");
    file_text_write_string(file,hash);
    file_text_close(file);
}
