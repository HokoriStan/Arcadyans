var startX;
var startY = 330;

var horizontalTiles = Menu.pageHorizontalTiles;

if (horizontalTiles % 2 == 0) //if even horizontal
{
    startX = view_xview+view_wview/2 - (horizontalTiles)/2 * (Game.tileWidth+Game.tileXOffset) + (Game.tileWidth+Game.tileXOffset)/2
}
else //if odd horizontal
{
    startX = view_xview+view_wview/2 - (horizontalTiles-1)/2 * (Game.tileWidth+Game.tileXOffset)
}

/*if (horizontalTiles % 2 == 0) //if even vertical
{
    startY = view_yview+view_hview/2 - (verticalTiles)/2 * (Game.tileHeight+Game.tileYOffset) + (Game.tileHeight+Game.tileYOffset)/2
}
else //if odd vertical
{
    startY = view_yview+view_hview/2 - (verticalTiles-1)/2 * (Game.tileHeight+Game.tileYOffset)
}*/

with (obj_buttonLevel)
{
    instance_destroy();
}
with (obj_unlockLevelPage)
{
    surface_free(surf);
    instance_destroy();
}

CalculatePagesUnlocked();

var buttonsToCreate = Menu.maxPageButtons;
if (buttonsToCreate*(Menu.pageIndex+1) > Game.createdLevels && (Menu.pageIndex <= Game.pagesUnlocked))
{
    buttonsToCreate = Game.createdLevels%(Menu.pageHorizontalTiles*Menu.pageVerticalTiles);
}

for (var i=0;i<buttonsToCreate;i++)
{
    var tile = instance_create( startX+(Game.tileWidth+Game.tileXOffset)*(i%horizontalTiles),
                                startY+(Game.tileHeight+Game.tileYOffset)*floor(i/horizontalTiles),
                                obj_buttonLevel);
    tile.level = i+Menu.maxPageButtons*Menu.pageIndex;
    if (tile.level > Game.unlockedLevel)
    {
        tile.unlocked = false;
    }
    if (Menu.pageIndex >= Game.pagesUnlocked)
    {
        tile.drawLock = false;
    }
    else
    {
        tile.coin = Game.levelCoin[tile.level];
    }
    Game.board[i%horizontalTiles,floor(i/horizontalTiles)] = tile;
    
    if (Menu.pageIndex > 0)
    {
        obj_buttonPreviousPage.turn = 1;
    }
    if (Menu.pageIndex <= Game.pagesUnlocked-1)
    {
        obj_buttonNextPage.turn = 1;
    }
}
if (Menu.pageIndex >= Game.pagesUnlocked)
{
    instance_create(0,0,obj_unlockLevelPage);
}

/*
for (var i=0;i<horizontalTiles;i++)
{
    for (var q=0;q<verticalTiles;q++)
    {
        var tile = instance_create( startX+(Game.tileWidth+Game.tileXOffset)*i,
                                    startY+(Game.tileHeight+Game.tileYOffset)*q,
                                    obj_buttonLevel);
        tile.level = i+q*horizontalTiles;
        if (tile.level > Game.unlockedLevel)
        {
            tile.unlocked = false;
        }
        tile.coin = Game.levelCoin[tile.level];
        Game.board[i,q] = tile;
    }
}*/
ResetTurnWaitTime();
