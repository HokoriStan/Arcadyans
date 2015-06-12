var horizontalTiles = Game.currentHorizontalTiles;
var verticalTiles = Game.currentVerticalTiles;
var startX;
var startY = 1;

if (horizontalTiles % 2 == 0) //if even horizontal
{
    startX = view_xview+view_wview/2 - (horizontalTiles)/2 * (Game.tileWidth+Game.tileXOffset) + (Game.tileWidth+Game.tileXOffset)/2
}
else //if odd horizontal
{
    startX = view_xview+view_wview/2 - (horizontalTiles-1)/2 * (Game.tileWidth+Game.tileXOffset)
}

if (horizontalTiles % 2 == 0) //if even vertical
{
    startY = view_yview+view_hview/2 - (verticalTiles)/2 * (Game.tileHeight+Game.tileYOffset) + (Game.tileHeight+Game.tileYOffset)/2
}
else //if odd vertical
{
    startY = view_yview+view_hview/2 - (verticalTiles-1)/2 * (Game.tileHeight+Game.tileYOffset)
}

with (obj_tile)
{
    instance_destroy();
}
for (var i=0;i<horizontalTiles;i++)
{
    for (var q=0;q<verticalTiles;q++)
    {
        var tile = instance_create( startX+(Game.tileWidth+Game.tileXOffset)*i,
                                    startY+(Game.tileHeight+Game.tileYOffset)*q,
                                    obj_tile);
        tile.arrayIndex = i+q*horizontalTiles;
        tile.turn = -1;
        Game.board[i,q] = tile;
    }
}
if (Game.loadLevel)
{
    for (var i=0;i<array_length_1d(Game.tilesToTurn);i++)
    {
        if (Game.USENEWLEVELCREATION)
        {
            var xIndex = floor(Game.tilesToTurn[i]);
            var yIndex = round(Game.tilesToTurn[i]%1.0*10);
            
            //show_debug_message("Game.tilesToTurn[i]: "+string(Game.tilesToTurn[i]));
            //show_debug_message("XINDEX: "+string(xIndex));
            //show_debug_message("YINDEX: "+string(yIndex));
            
            
            ChangeColorIndex(Game.board[xIndex,yIndex]);
            
            
            
        }
        else
        {
            TurnTiles(Game.board[Game.tilesToTurn[i]%Game.currentHorizontalTiles,floor(Game.tilesToTurn[i]/Game.currentVerticalTiles)]);
        }
    }
    if (os_browser != browser_not_a_browser)
    {
        for (var i=0;i<instance_number(obj_tile);i++)
        {
            var inst = instance_find(obj_tile,i);
            inst.colorIndex = 1;
        }
    }
    for (var i=0;i<array_length_1d(Game.bombs);i++)
    {
        if (Game.USENEWLEVELCREATION)
        {
            var xIndex = floor(Game.bombs[i]);
            var yIndex = round(Game.bombs[i]%1.0*10);
            Game.board[xIndex,yIndex].isBomb = true;
        }
        else
        {
            Game.board[Game.bombs[i]%Game.currentHorizontalTiles,floor(Game.bombs[i]/Game.currentVerticalTiles)].isBomb = true;
        }
    }
    for (var i=0;i<array_length_1d(Game.invisibleBombs);i++)
    {
        var xIndex = floor(Game.invisibleBombs[i]);
        var yIndex = round(Game.invisibleBombs[i]%1.0*10);
        Game.board[xIndex,yIndex].isBomb = true;
        Game.board[xIndex,yIndex].isInvisibleBomb = true;
    }
    
    
    if (Game.currentLevel == 0)
    {
        instance_create(0,0,obj_gestureTouch);
    }
    with (obj_buttonRetry)
    {
        if (image_xscale == 0)
        {
            turn = 1;
        }
    }
    with (obj_buttonUndo)
    {
        image_alpha = 0.5;
        if (image_xscale == 0)
        {
            turn = 1;
        }
    }
    with (obj_gameBack)
    {
        if (image_xscale == 0)
        {
            turn = 1;
        }
    }
    with (obj_hint)
    {
        if (image_xscale == 0)
        {
            turn = 1;
        }
    }
    obj_tapsLeft.image_index = 0;
    obj_tapsLeft.tapsLeft = Game.goldCoin;
    obj_tapsLeft.time = Game.goldCoin;
    obj_tapsLeft.drawSelf = true;
    Game.USENEWLEVELCREATION = true;
    ds_list_clear(Game.undoList);
    ds_list_clear(Game.solutionList);
    Game.solutionIndex = 0;
    Game.loadLevel = false;
}
ResetTurnWaitTime();
