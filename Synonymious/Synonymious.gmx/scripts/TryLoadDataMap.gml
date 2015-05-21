var dataMap;
if (file_exists("Data.txt"))
{
    var file = file_text_open_read("Data.txt");
    var encodedMap = file_text_read_string(file);
    file_text_close(file);
    dataMap = json_decode(encodedMap);
    
    if (dataMap != -1)
    {
        Game.dataMap = dataMap;
        Game.removeLetterAmount = ds_map_find_value(Game.dataMap,"removeLetterAmount");
        Game.hintAmount = ds_map_find_value(Game.dataMap,"hintAmount");
        exit;
    }
}
Game.dataMap = ds_map_create();
Game.removeLetterAmount = 3;
Game.hintAmount = 3;
ds_map_add(Game.dataMap,"removeLetterAmount",Game.removeLetterAmount);
ds_map_add(Game.dataMap,"hintAmount",Game.hintAmount);
