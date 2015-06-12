//Requires the level to check
//Returns: levelPoints, levelTime, levelSwipes, levelStars, dataString, currentLevel
levelPoints = 0;
levelTime = 0;
levelSwipes = 0;
levelStars = 0;
dataString = "";
if (file_exists("data.rar"))
{
    var str, pos, nPos, searchString, searchLevel, 
    
    str = scr_loadData("data.rar",0);
    searchLevel = argument0;
    if (searchLevel == -1 && boardSize == 5)
    {
        searchLevel = -2;
    }
    
    searchString = "cLevel";
    pos = string_pos(searchString,str);
    if (pos == 0)
    {
        return 1;
    }
    nPos = string_length(str);
    
    if (obj_controller.currentLevel == -1 && !global.auth)
    {
        obj_controller.currentLevel = real(string_digits(string_copy(str,pos,nPos-pos+1)));
        obj_controller.unlockedLevel = obj_controller.currentLevel;
    }
    
    str = string_delete(str,pos,nPos-pos+1);
    //str is now without cLevel

    dataString = str;
    pos = string_pos("lvl"+string(searchLevel),str);
    if (pos == 0)
    {
        return 2;
    }
    
    str = string_delete(str,1,pos+string_length("lvl"+string(searchLevel))-1);
    nPos = string_pos("lvl",str);
    if (nPos == 0) {nPos = string_length(str);}
    levelData = string_copy(str,1,nPos);
    if (levelData  == ""){show_message("levelData not found --> This error should be fixed!");show_message(str);}
    levelData  = "lvl"+string(searchLevel)+levelData;
    str = string_delete(str,1,nPos-1);
    //str is now without the data from the level it's searching for
    dataString = str;
    
    searchString = "pnts";
    pos = string_pos(searchString,levelData);
    pos += string_length(searchString);
    searchString = "tme";
    nPos = string_pos(searchString,levelData);
    if (nPos == 0) {show_message("Can't find "+searchString+".."+"#"+"LevelData = "+levelData+"#"+"String = "+str);
                    levelPoints = 0;}
    else {levelPoints = real(string_copy(levelData,pos,nPos-pos));}
    
    searchString = "tme";
    pos = string_pos(searchString,levelData);
    pos += string_length(searchString);
    searchString = "swps";
    nPos = string_pos(searchString,levelData);
    if (nPos == 0) {show_message("Can't find "+searchString+".."+"#"+"LevelData = "+levelData+"#"+"String = "+str);
                    levelTime = 0;}
    else {levelTime = real(string_copy(levelData,pos,nPos-pos));}
    
    searchString = "swps";
    pos = string_pos(searchString,levelData);
    pos += string_length(searchString);
    searchString = "strs";
    nPos = string_pos(searchString,levelData);
    if (nPos == 0) {show_message("Can't find "+searchString+".."+"#"+"LevelData = "+levelData+"#"+"String = "+str);
                    levelSwipes = 0;}
    else {levelSwipes = real(string_copy(levelData,pos,nPos-pos));}
    
    searchString = "strs";
    pos = string_pos(searchString,levelData);
    pos += string_length(searchString);
    nPos = string_length(levelData);
    levelStars = real(string_copy(levelData,pos,nPos-pos+1));
    return 3;
}
return 0;