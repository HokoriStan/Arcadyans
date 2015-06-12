var index = argument0.arrayIndex;
var X = index % Game.currentHorizontalTiles;
var Y = floor(index / Game.currentVerticalTiles);

var IDS;
IDS[0] = Game.board[X,Y];
if (X > 0)
{
    IDS[array_length_1d(IDS)] = Game.board[X-1,Y];
}
if (X < Game.currentHorizontalTiles-1)
{
    IDS[array_length_1d(IDS)] = Game.board[X+1,Y];
}
if (Y > 0)
{
    IDS[array_length_1d(IDS)] = Game.board[X,Y-1];
}
if (Y < Game.currentVerticalTiles-1)
{
    IDS[array_length_1d(IDS)] =  Game.board[X,Y+1];
}

var s = "";
for (var i=0;i<array_length_1d(IDS);i++)
{
    var ID = IDS[i];
    s += string(ID)+"#";
    ChangeColorIndex(ID);
    ID.turn = -1;
    if (ID.isBomb)
    {
        if (ID.isInvisibleBomb)
        {
            ID.explode = 0.5;
        }
        else
        {
            ID.explode = 0.15;
        }
    }
}