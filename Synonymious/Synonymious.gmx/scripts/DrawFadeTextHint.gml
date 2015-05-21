Game.hintFadeTextOffset = 0;
if (argument0 > 0)
{
    Game.hintFadeText = "+"+string(argument0);
    Game.hintFadeTextColor = c_green;
}
else
{
    Game.hintFadeText = string(argument0);
    Game.hintFadeTextColor = c_red;
}
