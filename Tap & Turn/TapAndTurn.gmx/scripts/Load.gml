if (Game.unlockedLevel < 0)
{
    Game.unlockedLevel = 0;
}
Game.undos = 20;

for (var i=0;i<Game.createdLevels;i++)
{
    Game.levelCoin[i] = 3;
}
var fileName = "Data.rar";
var value;

//DecryptFile(fileName);
ini_open(fileName);

Game.unlockedLevel = ini_read_real("General","UnlockedLevel",0);
Game.undos = ini_read_real("General","Undos",20);
for (var i=0;i<Game.createdLevels;i++)
{
    Game.levelCoin[i] = ini_read_real("Level"+string(i),"Coin",-1);
}
ini_close();
//EncryptFile(fileName);

//Loading solutions

fileName = "Solutions.rar";

ini_open(fileName);
for (var i=0;i<Game.createdLevels;i++)
{
    Game.solutionLists[i] = ds_list_create();
    var solution = ini_read_string("Level"+string(i),"SolutionList","");
    if (solution != "")
    {
        ds_list_read(Game.solutionLists[i],solution);
    }
}
ini_close();
