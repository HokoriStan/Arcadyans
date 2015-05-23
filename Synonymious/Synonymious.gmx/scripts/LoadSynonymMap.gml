var fileName = argument0;
var file = file_text_open_read(fileName+".txt");

Game.synonymMap = ds_map_create();
Game.keyArray = -1;
var keyList = ds_list_create();
var i = 0;

while (!file_text_eof(file))
{
    var line = file_text_read_string(file);
    var tab = chr(vk_tab);
    var tabPos = string_pos(tab,line);
    var key = string_copy(line,0,tabPos-1);
    
    var char = string_char_at(key,1);
    key = StringUpper(char)+string_delete(key,1,1);
    
    var value = string_copy(line,tabPos+1,string_length(line)-tabPos);
    value = StringUpper(value);
    
    if (string_length(value) > 12)
    {
        show_debug_message(key+" - "+value+" has exeeded the max length of 12 characters: "+string(string_length(value)));
    }
    else
    {
        ds_map_add(Game.synonymMap,key,value);
        ds_list_add(keyList,key);
    }
    i++;
    file_text_readln(file);
}

ds_list_shuffle(keyList);
for (var i=0;i<ds_list_size(keyList);i++)
{
    Game.keyArray[i] = ds_list_find_value(keyList,i);
}
ds_list_destroy(keyList);
file_text_close(file);
