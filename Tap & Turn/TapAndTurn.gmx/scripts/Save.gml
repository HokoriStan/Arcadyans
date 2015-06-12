if (Game.levelCompleted)
{
    if (Game.currentLevel+1 > Game.unlockedLevel)
    {
        Game.unlockedLevel ++;
    }
    if (obj_tapsLeft.image_index < Game.levelCoin[Game.currentLevel])
    {
        Game.levelCoin[Game.currentLevel] = obj_tapsLeft.image_index;
    }
}
var fileName = "Data.rar";
var value;

//DecryptFile(fileName);
ini_open(fileName);
if (Game.levelCompleted)
{
    var unlockedLevel = ini_read_real("General","UnlockedLevel",0);
    if (Game.currentLevel+1 > unlockedLevel)
    {
        ini_write_real("General","UnlockedLevel",Game.currentLevel+1);
        Game.unlockedLevel++;
    }
    var coin = ini_read_real("Level"+string(Game.currentLevel),"Coin",4);
    if (obj_tapsLeft.image_index < coin)
    {
        ini_write_real("Level"+string(Game.currentLevel),"Coin",obj_tapsLeft.image_index);
        Game.levelCoin[Game.currentLevel] = obj_tapsLeft.image_index;
    }
}
ini_write_real("General","Undos",Game.undos);
ini_close();
//EncryptFile(fileName);

//Saving solution

if (debug_mode && argument_count > 0)
{
    fileName = "Solutions.rar";
    
    ini_open(fileName);
    if (obj_tapsLeft.image_index == 0)
    {
        show_debug_message("Saved solutionlist["+string(Game.currentLevel)+"]");
        ini_write_string("Level"+string(Game.currentLevel),"SolutionList",ds_list_write(Game.solutionList));
    }
    ini_close();
}
