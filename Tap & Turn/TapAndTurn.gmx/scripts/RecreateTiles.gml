for (var i=0;i<Game.maxHorizontalTiles;i++)
{
    for (var q=0;q<Game.maxVerticalTiles;q++)
    {
        if (Game.board[i,q] != -1)
        {
            with (Game.board[i,q])
            {
                instance_destroy();
            }
        }
    }
}
CreateTiles(Game.currentHorizontalTiles,Game.currentVerticalTiles);
