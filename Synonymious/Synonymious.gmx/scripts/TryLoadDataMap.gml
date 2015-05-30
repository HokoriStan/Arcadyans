var dataMap;
if (file_exists(string(Game.synonymLanguage)+"Data.txt"))
{
    var file = file_text_open_read(string(Game.synonymLanguage)+"Data.txt");
    var encodedMap = file_text_read_string(file);
    file_text_close(file);
    dataMap = json_decode(encodedMap);
    
    if (dataMap != -1)
    {
        ds_map_destroy(Game.dataMap);
        Game.dataMap = dataMap;
        Game.removeLetterAmount = ds_map_find_value(Game.dataMap,"removeLetterAmount");
        Game.hintAmount = ds_map_find_value(Game.dataMap,"hintAmount");
        exit;
    }
    file_text_close(file);
}
ds_map_clear(Game.dataMap);
Game.removeLetterAmount = 3;
Game.hintAmount = 3;
ds_map_add(Game.dataMap,"removeLetterAmount",Game.removeLetterAmount);
ds_map_add(Game.dataMap,"hintAmount",Game.hintAmount);
