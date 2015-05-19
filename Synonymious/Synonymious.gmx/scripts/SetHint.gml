var index;
var list = ds_list_create();
if (argument_count == 0)
{
    for (var i=0;i<array_length_1d(Game.inputBox);i++)
    {
        if (Game.inputBox[i].letterBox == -1 || !Game.inputBox[i].letterBox.locked)
        {
            ds_list_add(list,i);
        }
    }
    ds_list_shuffle(list);
    index = ds_list_find_value(list,irandom(ds_list_size(list)-1));
    ds_list_add(Game.hintIndexes,index);
}
else
{
    show_debug_message("Setting hint to index: "+string(argument[0]));
    index = argument[0];
}

var targetInputBox = Game.inputBox[index];
var letterToPress = targetInputBox.requiredLetter;

if (targetInputBox.letter != letterToPress)
{
    if (targetInputBox.letter != "")
    {
        LetterBoxClick(targetInputBox.letterBox,true);
    }
    var letterBox = FindLetterBox(letterToPress);
    if (letterBox.x == letterBox.originalXPos && letterBox.y == letterBox.originalYPos)
    {
        LetterBoxClick(letterBox, false, targetInputBox);
    }
    else
    {
        letterBox.inputBox.letter = "";
        letterBox.inputBox.letterBox = -1;
        
        targetInputBox.letter = letterToPress;
        targetInputBox.letterBox = letterBox;
        letterBox.toXPos = targetInputBox.x;
        letterBox.toYPos = targetInputBox.y;
        letterBox.fromXPos = letterBox.x;
        letterBox.fromYPos = letterBox.y;
        letterBox.inputBox = targetInputBox;
        letterBox.moveSpeed = 40;
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
targetInputBox.letterBox.locked = true;
targetInputBox.letterBox.image_blend = 8454027;
with (obj_inputBox)
{
    startShake = false;
}
if (argument_count != 0)
{
    with (obj_levelCompletedMessage)
    {
        instance_destroy();
    }
}
ds_list_destroy(list);
