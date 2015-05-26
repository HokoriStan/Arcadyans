var xPos = argument0;
var yPos = argument1 + 5;

var textWidth = round(argument2*0.7 - 25);
var textHeight = round(argument3*0.7 - 36);
var textHeight = 34;
/*if ((textWidth & 1))
{
    textWidth++;
}
if ((textHeight & 1))
{
    textHeight++;
}*/

var cornerWidth = sprite_get_width(spr_buttonTopLeft);
var cornerHeight = sprite_get_height(spr_buttonTopLeft);

var targetWidth = round(textWidth + cornerWidth * 2);
var targetHeight = round(textHeight + cornerHeight * 2);

if (pressed)
{
    //show_debug_message(object_get_name(object_index)+"textWidth: "+string(textWidth));
    //show_debug_message(object_get_name(object_index)+"textHeight: "+string(textHeight));
}
if (width == -1 || height == -1)
{
    width = targetWidth;
    height = targetHeight;
}

/*draw_set_color(c_white);

draw_rectangle_custom(xPos,yPos,xPos+64,yPos+64,false);
draw_sprite_custom(spr_blankSprite,0,xPos+65,yPos);

draw_rectangle_custom(xPos,yPos+129/2,xPos+64,yPos+129/2+64,false);
draw_sprite_custom(spr_blankSprite,0,xPos+65,yPos+64.5);*/



var leftXPos = xPos - textWidth/2 - cornerWidth;
var topYPos = yPos - textHeight/2 - cornerHeight;

draw_sprite_custom(spr_buttonTopLeft,0,leftXPos,topYPos);

var rightXPos = xPos + textWidth/2 + cornerWidth;
var topYPos = yPos - textHeight/2 - cornerHeight;

draw_sprite_ext_custom(spr_buttonTopLeft,0,rightXPos,topYPos,-1,1,0,c_white,1);

if (!pressed)
{
    var leftXPos = xPos - textWidth/2 - cornerWidth;
    var bottomYPos = yPos + textHeight/2;
    
    draw_sprite_custom(spr_buttonBottomLeft,0,leftXPos,bottomYPos);
    
    var rightXPos = xPos + textWidth/2 + cornerWidth;
    var bottomYPos = yPos + textHeight/2;
    
    draw_sprite_ext_custom(spr_buttonBottomLeft,0,rightXPos,bottomYPos,-1,1,0,c_white,1);
}
else
{
    var leftXPos = xPos - textWidth/2 - cornerWidth;
    var bottomYPos = yPos + textHeight/2 + cornerHeight - 9;
    
    draw_sprite_ext_custom(spr_buttonTopLeft,0,leftXPos,bottomYPos,1,-1,0,c_white,1);
    
    var rightXPos = xPos + textWidth/2 + cornerWidth;
    var bottomYPos = yPos + textHeight/2 + cornerHeight - 9;
    
    draw_sprite_ext_custom(spr_buttonTopLeft,0,rightXPos,bottomYPos,-1,-1,0,c_white,1);
}

var leftCenterXPos = xPos - textWidth/2;
var topYPos = yPos - textHeight/2 - cornerHeight;
var rightCenterXPos = xPos + textWidth/2;
var bottomCenterYPos = yPos + textHeight/2;

if (pressed)
{
    bottomCenterYPos += cornerHeight - 9;
}

draw_set_color(c_white);
draw_rectangle_custom(leftCenterXPos,topYPos,rightCenterXPos,bottomCenterYPos,false);

if (!pressed)
{
    var leftCenterXPos = xPos - textWidth/2-1;
    var bottomCenterYPos = yPos + textHeight/2;
    var centerWidth = textWidth+3;
    
    draw_sprite_stretched(spr_buttonBottom,0,leftCenterXPos,bottomCenterYPos,centerWidth,cornerHeight);
}

var leftXPos = xPos - textWidth/2 - cornerWidth;
var topCenterYPos = yPos - textHeight/2-1;
var leftCenterXPos = xPos - textWidth/2;
var bottomCenterYPos = yPos + textHeight/2;

draw_set_color(c_white);
draw_rectangle_custom(leftXPos,topCenterYPos,leftCenterXPos,bottomCenterYPos,false);

var rightCenterXPos = xPos + textWidth/2;
var topCenterYPos = yPos - textHeight/2-1;
var rightXPos = xPos + textWidth/2 + cornerWidth;
var bottomCenterYPos = yPos + textHeight/2;

draw_set_color(c_white);
draw_rectangle_custom(rightCenterXPos,topCenterYPos,rightXPos,bottomCenterYPos,false);
