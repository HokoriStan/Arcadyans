var level = argument0;

if (level >= ds_map_size(Game.synonymMap))
{
    level = 0;
}

Game.question = Game.keyArray[level];
Game.answer = ds_map_find_value(Game.synonymMap,question);
Game.levelSolved = false;
obj_buttonHint.showingHints = 0;
Game.debug = false;
Game.debugClick = 0;
ds_list_clear(Game.hintIndexes);

var letterList = ds_list_create();
var answerLetterList = ds_list_create();

for (var i=0;i<string_length(Game.answer);i++)
{
    var char = string_char_at(Game.answer, i+1);
    ds_list_add(answerLetterList,char);
    ds_list_add(letterList,char);
}
var letterAmount = 12;

for (var i=0;i<letterAmount-string_length(Game.answer);i++)
{
     ds_list_add(letterList,choose(chr(65+floor(random(26)))));
}


ds_list_shuffle(letterList);

//LOAD LEVEL

var levelLoaded = LoadLevel(level, letterList, Game.hintIndexes);

//LOAD LEVEL

var centerXPos = room_width*0.5;
var centerYPos = room_height*0.65;

var spacing = 20;
var xOffset = sprite_get_width(spr_full)+spacing;
var yOffset = sprite_get_height(spr_full)+spacing;

var leftXPos = centerXPos - (letterAmount/4 * xOffset) + xOffset/2;
var topYPos = centerYPos - yOffset/2;

for (var i=0;i<letterAmount;i++)
{
    var xIndex = i mod (letterAmount/2);
    var yIndex = i div (letterAmount/2);
    
    var xPos = leftXPos + xIndex * xOffset;
    var yPos = topYPos + yIndex * yOffset;
   
    var val = ds_list_find_value(letterList,i);
    if (!is_undefined(val))
    {
        var instance = instance_create(xPos,yPos,obj_letterBox);
        instance.letter = val;
    }    
}

var centerXPos = room_width*0.5;
var centerYPos = room_height*0.5;

var spacing = 5;
var xOffset = sprite_get_width(spr_empty)+spacing;
var yOffset = sprite_get_height(spr_empty)+spacing;

var leftXPos = centerXPos - (string_length(answer)/2 * xOffset) + xOffset/2;
Game.inputBox = -1;
for (var i=0;i<string_length(answer);i++)
{
    var xPos = leftXPos + i * xOffset;
    var yPos = centerYPos;

    Game.inputBox[i] = instance_create(xPos,yPos,obj_inputBox);
    Game.inputBox[i].requiredLetter = ds_list_find_value(answerLetterList,i);
}
if (instance_number(obj_letterBox) <= string_length(Game.answer))
{
    obj_buttonRemoveLetter.image_alpha = 0.7;
}
else
{
    obj_buttonRemoveLetter.image_alpha = 1;
}

if (Game.levelSolved)
{
    Game.levelSolved = false;
    for (var i=0;i<array_length_1d(Game.inputBox);i++)
    {
        SetHint(i);
    }
    
}
else
{
    for (var i=0;i<ds_list_size(Game.hintIndexes);i++)
    {
        SetHint(ds_list_find_value(Game.hintIndexes,i));
    }
}

ds_list_destroy(letterList);
ds_list_destroy(answerLetterList);
