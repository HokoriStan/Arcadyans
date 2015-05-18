var list = ds_list_create();
for (var i=0;i<array_length_1d(Game.inputBox);i++)
{
    if (!Game.inputBox[i].locked)
    {
        ds_list_add(list,i);
    }
}
ds_list_shuffle(list);

var targetInputBox = Game.inputBox[random(ds_list_size(list))];
var letterToPress = targetInputBox.requiredLetter;

var letterToPress = string_char_at(Game.answer,showingHints+1);
if (Game.inputBox[showingHints].letter != letterToPress)
{
    if (Game.inputBox[showingHints].letter != "")
    {
        LetterBoxClick(Game.inputBox[showingHints].letterBox,true);
    }
    var letterBox = FindLetterBox(letterToPress);
    if (letterBox.x == letterBox.originalXPos && letterBox.y == letterBox.originalYPos)
    {
        LetterBoxClick(letterBox);
    }
    else
    {
        letterBox.inputBox.letter = "";
        letterBox.inputBox.letterBox = -1;
        
        Game.inputBox[showingHints].letter = letterToPress;
        Game.inputBox[showingHints].letterBox = letterBox;
        letterBox.toXPos = Game.inputBox[showingHints].x;
        letterBox.toYPos = Game.inputBox[showingHints].y;
        letterBox.fromXPos = letterBox.x;
        letterBox.fromYPos = letterBox.y;
        letterBox.inputBox = Game.inputBox[showingHints];
        letterSet = true;
        with (obj_inputBox)
        {
            if (id.letterBox != -1)
            {
                if (!id.letterBox.locked)
                {
                    id.letterBox.image_blend = c_white;
                }
            }
        }
    }
}
Game.inputBox[showingHints].letterBox.locked = true;
Game.inputBox[showingHints].letterBox.image_blend = c_green;
//CheckAnswer(true);
with (obj_inputBox)
{
    startShake = false;
}
showingHints++;

/*var letterToPress = string_char_at(Game.answer,showingHints+1);
if (Game.inputBox[showingHints].letter != letterToPress)
{
    if (Game.inputBox[showingHints].letter != "")
    {
        LetterBoxClick(Game.inputBox[showingHints].letterBox,true);
    }
    var letterBox = FindLetterBox(letterToPress);
    if (letterBox.x == letterBox.originalXPos && letterBox.y == letterBox.originalYPos)
    {
        LetterBoxClick(letterBox);
    }
    else
    {
        letterBox.inputBox.letter = "";
        letterBox.inputBox.letterBox = -1;
        
        Game.inputBox[showingHints].letter = letterToPress;
        Game.inputBox[showingHints].letterBox = letterBox;
        letterBox.toXPos = Game.inputBox[showingHints].x;
        letterBox.toYPos = Game.inputBox[showingHints].y;
        letterBox.fromXPos = letterBox.x;
        letterBox.fromYPos = letterBox.y;
        letterBox.inputBox = Game.inputBox[showingHints];
        letterSet = true;
        with (obj_inputBox)
        {
            if (id.letterBox != -1)
            {
                if (!id.letterBox.locked)
                {
                    id.letterBox.image_blend = c_white;
                }
            }
        }
    }
}
Game.inputBox[showingHints].letterBox.locked = true;
Game.inputBox[showingHints].letterBox.image_blend = c_green;
//CheckAnswer(true);
with (obj_inputBox)
{
    startShake = false;
}
showingHints++;
