var ID = argument0;
var colorIndex = ID.colorIndex+1;

if (colorIndex >= Game.currentTileColors)
{
    colorIndex = 0;
}
ID.colorIndex = colorIndex;