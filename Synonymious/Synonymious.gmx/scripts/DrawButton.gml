var xPos = argument0;
var yPos = argument1 + 9;

var textWidth = argument2 - 35;
var textHeight = argument3 - 30;

var cornerWidth = sprite_get_width(spr_buttonTopLeft);
var cornerHeight = sprite_get_height(spr_buttonTopLeft);

var targetWidth = textWidth + cornerWidth * 2;
var targetHeight = textHeight + cornerHeight * 2;

surface = surface_create(targetWidth,targetHeight);
surface_set_target(surface);
draw_clear_alpha(c_black, 0);

var xPos = textWidth/2+cornerWidth;
var yPos = textHeight/2+cornerHeight;

var leftXPos = xPos - textWidth/2 - cornerWidth;
var topYPos = yPos - textHeight/2 - cornerHeight;

draw_sprite(spr_buttonTopLeft,0,leftXPos,topYPos);

var rightXPos = xPos + textWidth/2 + cornerWidth;
var topYPos = yPos - textHeight/2 - cornerHeight;

draw_sprite_ext(spr_buttonTopLeft,0,rightXPos+1,topYPos,-1,1,0,c_white,1);

if (image_index == 0)
{
    var leftXPos = xPos - textWidth/2 - cornerWidth;
    var bottomYPos = yPos + textHeight/2;
    
    draw_sprite(spr_buttonBottomLeft,0,leftXPos,bottomYPos);
    
    var rightXPos = xPos + textWidth/2 + cornerWidth;
    var bottomYPos = yPos + textHeight/2;
    
    draw_sprite_ext(spr_buttonBottomLeft,0,rightXPos+1,bottomYPos,-1,1,0,c_white,1);
}
else
{
    var leftXPos = xPos - textWidth/2 - cornerWidth;
    var bottomYPos = yPos + textHeight/2 + cornerHeight - 9;
    
    draw_sprite_ext(spr_buttonTopLeft,0,leftXPos,bottomYPos,1,-1,0,c_white,1);
    
    var rightXPos = xPos + textWidth/2 + cornerWidth;
    var bottomYPos = yPos + textHeight/2 + cornerHeight - 9;
    
    draw_sprite_ext(spr_buttonTopLeft,0,rightXPos+1,bottomYPos,-1,-1,0,c_white,1);
}

var leftCenterXPos = xPos - textWidth/2;
var topYPos = yPos - textHeight/2 - cornerHeight;
var rightCenterXPos = xPos + textWidth/2;
var bottomCenterYPos = yPos + textHeight/2;

if (image_index == 1)
{
    bottomCenterYPos += cornerHeight - 9 - 1;
}

draw_set_color(c_white);
draw_rectangle(leftCenterXPos,topYPos,rightCenterXPos,bottomCenterYPos,false);

if (image_index == 0)
{
    var leftCenterXPos = xPos - textWidth/2;
    var bottomCenterYPos = yPos + textHeight/2;
    var centerWidth = textWidth+1;
    
    draw_sprite_stretched(spr_buttonBottom,0,leftCenterXPos,bottomCenterYPos,centerWidth,cornerHeight);
}

var leftXPos = xPos - textWidth/2 - cornerWidth;
var topCenterYPos = yPos - textHeight/2;
var leftCenterXPos = xPos - textWidth/2;
var bottomCenterYPos = yPos + textHeight/2;

draw_set_color(c_white);
draw_rectangle(leftXPos,topCenterYPos,leftCenterXPos,bottomCenterYPos,false);

var rightCenterXPos = xPos + textWidth/2;
var topCenterYPos = yPos - textHeight/2;
var rightXPos = xPos + textWidth/2 + cornerWidth;
var bottomCenterYPos = yPos + textHeight/2;

draw_set_color(c_white);
draw_rectangle(rightCenterXPos,topCenterYPos,rightXPos,bottomCenterYPos,false);

surface_reset_target();
return surface;
