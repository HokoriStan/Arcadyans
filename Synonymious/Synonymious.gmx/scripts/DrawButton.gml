var xPos = argument[0];
var yPos = argument[1] + 5;

var textWidth = round(argument[2]*0.7 - 25);
var textHeight = round(argument[3]*0.7 - 36);
var isMessage = false;
var isQuestion = false;
if (argument_count < 5)
{
    var textHeight = 34;
}
else
{
    isMessage = argument[4];
    isQuestion = argument[5];
}

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
var color = c_white;
if (isMessage)
{
    color = c_black;
}
draw_sprite_ext_custom(spr_buttonTopLeft,0,leftXPos,topYPos,1,1,0,color,image_alpha);
var rightXPos = xPos + textWidth/2 + cornerWidth;
var topYPos = yPos - textHeight/2 - cornerHeight;

draw_sprite_ext_custom(spr_buttonTopLeft,0,rightXPos,topYPos,-1,1,0,color,image_alpha);

if (!pressed)
{
    var leftXPos = xPos - textWidth/2 - cornerWidth;
    var bottomYPos = yPos + textHeight/2;
    
    draw_sprite_ext_custom(spr_buttonBottomLeft,0,leftXPos,bottomYPos,1,1,0,c_white,image_alpha);
    
    var rightXPos = xPos + textWidth/2 + cornerWidth;
    var bottomYPos = yPos + textHeight/2;
    
    draw_sprite_ext_custom(spr_buttonBottomLeft,0,rightXPos,bottomYPos,-1,1,0,c_white,image_alpha);
}
else
{
    var leftXPos = xPos - textWidth/2 - cornerWidth;
    var bottomYPos = yPos + textHeight/2 + cornerHeight - 9;
    
    draw_sprite_ext_custom(spr_buttonTopLeft,0,leftXPos,bottomYPos,1,-1,0,c_white,image_alpha);
    
    var rightXPos = xPos + textWidth/2 + cornerWidth;
    var bottomYPos = yPos + textHeight/2 + cornerHeight - 9;
    
    draw_sprite_ext_custom(spr_buttonTopLeft,0,rightXPos,bottomYPos,-1,-1,0,c_white,image_alpha);
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
draw_set_alpha(image_alpha);
draw_rectangle_custom(leftCenterXPos,topYPos,rightCenterXPos,bottomCenterYPos,false);
if (isMessage)
{
    draw_set_color(c_black);
    draw_rectangle_custom(leftCenterXPos,topYPos,rightCenterXPos,topYPos+40,false);
}

if (!pressed)
{
    var leftCenterXPos = xPos - textWidth/2-1;
    var bottomCenterYPos = yPos + textHeight/2;
    var centerWidth = textWidth+3;
    
    draw_sprite_stretched_ext(spr_buttonBottom,0,leftCenterXPos,bottomCenterYPos,centerWidth,cornerHeight,c_white,image_alpha);
}

var leftXPos = xPos - textWidth/2 - cornerWidth;
var topCenterYPos = yPos - textHeight/2-1;
var leftCenterXPos = xPos - textWidth/2;
var bottomCenterYPos = yPos + textHeight/2;

draw_set_color(c_white);
draw_rectangle_custom(leftXPos,topCenterYPos,leftCenterXPos,bottomCenterYPos,false);
if (isMessage)
{
    draw_set_color(c_black);
    draw_rectangle_custom(leftXPos,topCenterYPos,leftCenterXPos,topCenterYPos+40-cornerHeight+1,false);
}

var rightCenterXPos = xPos + textWidth/2;
var topCenterYPos = yPos - textHeight/2-1;
var rightXPos = xPos + textWidth/2 + cornerWidth;
var bottomCenterYPos = yPos + textHeight/2;

draw_set_color(c_white);
draw_rectangle_custom(rightCenterXPos,topCenterYPos,rightXPos,bottomCenterYPos,false);
if (isMessage)
{
    draw_set_color(c_black);
    draw_rectangle_custom(rightCenterXPos,topCenterYPos,rightXPos,topCenterYPos+40-cornerHeight+1,false);
    
    var leftXPos = xPos - textWidth/2 - cornerWidth;
    var rightXPos = xPos + textWidth/2 + cornerWidth;
    var bottomCenterYPos = yPos + textHeight/2;
    
    //draw_rectangle_custom(leftXPos,bottomCenterYPos-71,rightXPos,bottomCenterYPos-68,false);
    
    draw_set_color(c_white);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    var text = "Message"
    if (isQuestion)
    {
        text = "Question";
    }
    draw_text_transformed(xPos,yPos-textHeight/2,text,0.3,0.3,0);
    draw_set_valign(fa_middle);
}
draw_set_alpha(1);
