if (file_exists("Data.txt"))
{
    var file = file_text_open_read("Data.txt");
    var encodedMap = file_text_read_string(file);
    file_text_close(file);
    var dataMap = json_decode(encodedMap);
    
    if (dataMap != -1)
    {
        Game.dataMap = dataMap;
        return dataMap;
    }
    
}
return ds_map_create();
