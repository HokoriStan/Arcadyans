var horizontalLevels = 5;
var verticalLevels = 5;
var pageLevels = horizontalLevels*verticalLevels;
var spacing = 10;
var xOffset = sprite_get_width(spr_buttonSquareSmall)+spacing;
var yOffset = sprite_get_height(spr_buttonSquareSmall)+spacing;

var centerX = room_width/2;
var leftXPos = centerX - (horizontalLevels/2 * xOffset) + xOffset/2;
var topYPos = 350;

with (obj_buttonLevel)
{
    instance_destroy();   
}

var level;
for (var i=0;i<pageLevels;i++)
{
    var xIndex = i mod horizontalLevels;
    var yIndex = i div horizontalLevels;
    
    level = i + Game.levelSelectionPage * pageLevels;
    
    if (level < ds_map_size(Game.synonymMap))
    {
        var instance = instance_create(leftXPos+xIndex*xOffset,topYPos+yIndex*yOffset,obj_buttonLevel);
        instance.level = level;
    }
    else
    {
        break;
    }
}
if (level >= ds_map_size(Game.synonymMap))
{
    with (obj_buttonNextPage)
    {
        instance_destroy();
    }
}
else if (!instance_exists(obj_buttonNextPage))
{
    instance_create(leftXPos+(horizontalLevels-1)*xOffset,room_height*0.85,obj_buttonNextPage);
}
if (Game.levelSelectionPage == 0)
{
    with (obj_buttonPreviousPage)
    {
        instance_destroy();
    }
}
else if (!instance_exists(obj_buttonPreviousPage))
{
    instance_create(leftXPos,room_height*0.85,obj_buttonPreviousPage);
}
