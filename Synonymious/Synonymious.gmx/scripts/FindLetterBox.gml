var letter = argument0;
var letterInstance = -1;
for (var i=0;i<instance_number(obj_letterBox);i++)
{
    var instance = instance_find(obj_letterBox,i);
    if (instance.letter == argument0 && !instance.locked)
    {
        if (instance.x == instance.originalXPos && instance.y == instance.originalYPos)
        {
            return instance;
        }
        else
        {
            letterInstance = instance;
        }
    }
}
return letterInstance;
