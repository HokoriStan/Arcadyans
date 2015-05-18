var dontChangeColor = false;
var targetInputBox = -1;
if (argument_count > 1)
{
    dontChangeColor = argument[1];
    if (argument_count > 2)
    {
        targetInputBox = argument[2];
    }
}

with (argument[0])
{
    if (!Game.levelSolved)
    {
        if (x == originalXPos && y == originalYPos)
        {
            for (var i=0;i<array_length_1d(Game.inputBox);i++)
            {
                if ( (Game.inputBox[i].letter == "" && targetInputBox == -1) || (targetInputBox == Game.inputBox[i] && targetInputBox != -1) )
                {
                    Game.inputBox[i].letter = letter;
                    Game.inputBox[i].letterBox = id;
                    toXPos = Game.inputBox[i].x;
                    toYPos = Game.inputBox[i].y;
                    fromXPos = x;
                    fromYPos = y;
                    inputBox = Game.inputBox[i];
                    break;
                }
            }
            CheckAnswer();
        }
        else
        {
            if (image_blend == 8421631 || image_blend == 8454027)
            {
                if (!dontChangeColor)
                {
                    with (obj_inputBox)
                    {
                        if (!letterBox.locked)
                        {
                            letterBox.image_blend = c_white;
                        }
                    }
                }
                else
                {
                    image_blend = c_white;
                }
            }
            toXPos = originalXPos;
            toYPos = originalYPos;
            fromXPos = x;
            fromYPos = y;
            inputBox.letter = "";
            inputBox.letterBox = -1;
            inputBox = -1;
            shakeCount = 0;
        }
    }
}
