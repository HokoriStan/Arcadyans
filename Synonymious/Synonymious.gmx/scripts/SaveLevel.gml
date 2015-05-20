var level = argument0;

var data = string(Game.levelSolved);
for (var i=0;i<instance_number(obj_letterBox);i++)
{
    data += instance_find(obj_letterBox,i).letter;
}

for (var i=0;i<ds_list_size(Game.hintIndexes);i++)
{
    var index = ds_list_find_value(Game.hintIndexes,i);
    if (index < 10)
    {
        data += "0";
    }
    data += string(index);
}

if (ds_map_exists(Game.dataMap,"Level "+string(level)))
{
    ds_map_replace(Game.dataMap,"Level "+string(level),data);
}
else
{
    ds_map_add(Game.dataMap,"Level "+string(level),data);
}
SaveDataMap();

//show_debug_message(string(ds_map_find_value(Game.dataMap,"Level "+string(level))));
