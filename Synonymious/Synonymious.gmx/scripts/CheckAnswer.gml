var ignoreLevelNotSolved = false;
if (argument_count > 0)
{
    ignoreLevelNotSolved = argument[0];
}
var levelSolved = true;
for (var i=0;i<instance_number(obj_inputBox);i++)
{
    var instance = instance_find(obj_inputBox,i);
    if (instance.letter == "")
    {
        exit;
    }
    else if (instance.letter != instance.requiredLetter)
    {
        levelSolved = false;
    }
}
if (levelSolved)
{
    Game.levelSolved = true;
    if (!LevelSolved(Game.level))
    {
        Game.removeLetterAmount ++;
        Game.hintAmount ++;
        DrawFadeTextHint(1);
        DrawFadeTextRemoveLetter(1);
        ds_map_replace(Game.dataMap,"removeLetterAmount",Game.removeLetterAmount);
        ds_map_replace(Game.dataMap,"hintAmount",Game.hintAmount);
    }
    SaveLevel(Game.level);
    if (!instance_exists(obj_levelSolvedText))
    {
        instance_create(x,y,obj_levelSolvedText);
        obj_levelSolvedText.nextLevel = true;
    }
    //Game.alarm[0] = room_speed;
    with (obj_inputBox)
    {
        letterBox.image_blend = 8454027;
    }
}
else if (!ignoreLevelNotSolved)
{
    with (obj_inputBox)
    {
        startShake = true;
        alarm[0] = 7;
    }
}
