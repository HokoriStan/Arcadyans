var invertTurning = false;
if (argument_count == 1)
{
    invertTurning = !Game.devModeOn;
}
with (obj_tile)
{
    turnWaitTime = arrayIndex*0.02;
}
for (var i=0;i<instance_number(obj_buttonLevel);i++)
{
    var instance = instance_find(obj_buttonLevel,i);
    if (!invertTurning)
    {
        instance.turnWaitTime = (instance.level%Menu.maxPageButtons)*0.02;
    }
    else
    {
        instance.turnWaitTime = (instance_number(obj_buttonLevel))*0.02-(instance.level%instance_number(obj_buttonLevel))*0.02;
    }
}
/*with (obj_buttonLevel)
{
    turnWaitTime = (level%Menu.maxPageButtons)*0.02;
}*/
with (obj_buttonRetry)
{
    turnWaitTime = (Game.currentHorizontalTiles*Game.currentVerticalTiles+1)*0.02;
}
with (obj_buttonUndo)
{
    turnWaitTime = (Game.currentHorizontalTiles*Game.currentVerticalTiles+1)*0.02;
}
with (obj_gameBack)
{
    turnWaitTime = (Game.currentHorizontalTiles*Game.currentVerticalTiles+1)*0.02;
}
/*with (obj_buttonLevelSelection)
{
    turnWaitTime = 0.05;
}
with (obj_menuBack)
{
    turnWaitTime = 0.1;
}
with (obj_levelSelectionBack)
{
    turnWaitTime = (instance_number(obj_buttonLevel)+1)*0.02;
}
with (obj_buttonPreviousPage)
{
    turnWaitTime = (instance_number(obj_buttonLevel)+1)*0.02;
}
with (obj_buttonNextPage)
{
    turnWaitTime = (instance_number(obj_buttonLevel)+1)*0.02;
}*/
