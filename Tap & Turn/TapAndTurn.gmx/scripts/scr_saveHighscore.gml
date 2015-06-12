returnValue = scr_readLevelScores(level);
switch (returnValue)
{
    case 0: show_debug_message("The file: data.rar doesn't exist yet");
    break;
    case 1: show_debug_message("The current level has not been found but the file does exist.. --> ERROR!");
    break;
    case 2: show_debug_message("The current level has been found, but no level-data has been found");
    break;
    case 3: show_debug_message("The current level and level-data have been found");
    break;
}

if (argument0 == 0)
{
    highestPoints = points;
    highestTime = time;
    highestSwipes = swipes;
    highestStars = stars;
    highestLevel = unlockedLevel
}
else
{
    highestPoints = random(100);
    highestTime = random(100);
    highestSwipes = random(100);
    highestStars = random(100);
    highestLevel = 0;
}

if (returnValue == 3)
{
    if (levelPoints > points) {highestPoints = levelPoints;}
    if (levelTime < time && time != -1) {highestTime = levelTime;}
    if (levelSwipes > swipes) {highestSwipes = levelSwipes;}
    if (levelStars > stars) {highestStars = levelStars;}
    if (currentLevel > unlockedLevel) {highestLevel = currentLevel;}
}

if (argument0 == 0)
{
    str = "";
    if (level == -1 && boardSize == 5)
    {
        str += "lvl"+string(level-1);
        //if it's a standard level and the boardSize is 5, save the level as -2 instead of -1
    }
    else
    {
        str += "lvl"+string(level);
    }
}
str += "pnts"+string(highestPoints);
str += "tme"+string(highestTime);
str += "swps"+string(highestSwipes);
str += "strs"+string(highestStars);
str += "cLevel"+string(highestLevel);

str = dataString + str;

scr_saveData(str,"data.rar",0);