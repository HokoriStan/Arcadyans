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
    Game.alarm[0] = room_speed;
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
