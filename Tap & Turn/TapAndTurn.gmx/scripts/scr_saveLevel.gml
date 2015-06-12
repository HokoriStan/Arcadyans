if (argument0 == 0)
{
    if (saveCounter == 0 || saveAll)
    {
        stringToSave = string(level)+":";
        stringToSave += string(boardSize)+":";
        stringToSave += string(time)+":";
        stringToSave += string(swipes)+":";
        stringToSave += string(points)+":";
        stringToSave += string(shuffleSwipes)+":";
        stringToSave += string(reverseDirectionSwipes)+":";
        stringToSave += string(randomMovesSwipes)+":";
    }
}
else
{
    var str;
    str = "-:";
    str += string(choose(4,5))+":";
    str += string(random(100))+":";
    str += string(floor(random_range(0,50)))+":";
    str += string(floor(random_range(0,50)))+":";
}

if (argument0 != 0)
{
    for (var i=0;i<5;i++)
    {
        for (var q=0;q<5;q++)
        {
            str += string(choose(0,1,2))+":"
            str += chr(floor(random_range(20,200)))+":";
        }
    }
}
else if ( ((saveCounter+0.04) mod 1 < 0.05 && round(saveCounter) == 0) || saveAll)
{
    for (var i=0;i<5;i++)
    {
        for (var q=0;q<5;q++)
        {
            if (i < boardSize && q < boardSize)
            {
                place = board[i,q];
                if (place != -1 && place != -2 && instance_exists(place))
                {
                    if (place.object_index == obj_panel)
                    {
                        stringToSave += "1:";
                    }
                    if (place.object_index == obj_frozenPanel)
                    {
                        stringToSave += "2:";
                    }
                    stringToSave += string(place.number)+":";
                }
                else
                {
                    stringToSave += "0:";
                    stringToSave += chr(random_range(200,200))+":";
                }
            }
            else
            {
                stringToSave += string(choose(0,1,2))+":"
                stringToSave += chr(floor(random_range(200,200)))+":";
            }
            stringToSave += chr(random_range(200,200))+":";
        }
    }
}
if ( (round(saveCounter) == 1 && ((saveCounter+0.04) mod 1 < 0.05)) || argument0 != 0 || saveAll)
{
    data = "";
    dataStandard = "";
    dataMissions = "";
    if (file_exists("data.rar"))
    {
        file = file_text_open_read("data.rar");
        data = file_text_read_string(file);
        file_text_readln(file);
        dataStandard = file_text_read_string(file);
        file_text_readln(file);
        dataMissions = file_text_read_string(file);
        file_text_close(file);
    }
}
if ( (round(saveCounter) == 2 && ((saveCounter+0.04) mod 1 < 0.05)) || argument0 != 0 || saveAll)
{
    
    if (argument0 != 0)
    {
        if (level == -1)
        {
            scr_saveData(str,"data.rar",1);
        }
        else
        {
            scr_saveData(str,"data.rar",2);
        }
    }
    else
    {
        if (level == -1)
        {
            scr_saveData(stringToSave,"data.rar",1);
        }
        else
        {
            scr_saveData(stringToSave,"data.rar",2);
        }
    }
}
if (argument0 == 0)
{
    saveCounter += 0.05;
    if (saveCounter >= 3 || saveAll)
    {
        saveLevel = false;
        saveAll = false;
        stringToSave = "";
        saveCounter = 0;
    }
}