var level = argument0;
var letterList = argument1;
var hintIndexes = argument2;

if (ds_map_exists(Game.dataMap,"Level "+string(level)))
{
    ds_list_clear(letterList);
    ds_list_clear(hintIndexes);
    var data = ds_map_find_value(Game.dataMap,"Level "+string(level));
    Game.levelSolved = string_char_at(data,1) == "1";
    data = string_copy(data,2,string_length(data)-1);

    while (string_length(data) > 0 && (string_byte_at(data,1) >= 65 || string_char_at(data,1) == " ") )
    {
        ds_list_add(letterList,string_char_at(data,1));
        data = string_copy(data,2,string_length(data)-1);
    }
    
    while (string_length(data) > 0)
    {
        ds_list_add(hintIndexes,real(string_copy(data,1,2)));
        data = string_copy(data,3,string_length(data)-2);
    }
    
    show_debug_message("Game.levelSolved: "+string(Game.levelSolved));
    for (var i=0;i<ds_list_size(letterList);i++)
    {
        show_debug_message("letters[i]: "+ds_list_find_value(letterList,i));
    }
    for (var i=0;i<ds_list_size(hintIndexes);i++)
    {
        show_debug_message("hintIndexess[i]: "+string(ds_list_find_value(hintIndexes,i)));
    }
    return true;
}
return false;
