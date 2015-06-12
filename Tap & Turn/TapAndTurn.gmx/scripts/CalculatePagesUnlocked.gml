Game.totalCoins = 0;
for (var i=0;i<array_length_1d(Game.levelCoin);i++)
{
    switch (Game.levelCoin[i])
    {
        case 0: Game.totalCoins += 3;    break;
        case 1: Game.totalCoins += 2;    break;
        case 2: Game.totalCoins += 1;    break;
    }
}
Game.pagesUnlocked = floor(Game.totalCoins/(Menu.maxPageButtons*2))+1;
return Game.pagesUnlocked;
