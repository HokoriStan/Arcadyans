Game.removeLetterFadeTextOffset = 0;
if (argument0 > 0)
{
    Game.removeLetterFadeText = "+"+string(argument0);
    Game.removeLetterFadeTextColor = c_green;
}
else
{
    Game.removeLetterFadeText = string(argument0);
    Game.removeLetterFadeTextColor = c_red;
}
