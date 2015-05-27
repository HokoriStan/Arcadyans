///DrawTextShadow(x, y, text, shadowOffset, scale = 1, textColor = c_white, shadowColor = c_black, shadowAlpha = 0.25);
var xPos = argument[0];
var yPos = argument[1]
var text = argument[2];
var shadowOffset = argument[3];
var scale = 1;
var textColor = c_white;
var shadowColor = c_black;
var shadowAlpha = 0.25;

if (argument_count > 4)
{
    scale = argument[4];
    if (argument_count > 5)
    {
        textColor = argument[5];
        if (argument_count > 6)
        {
            shadowColor = argument[6];
            if (argument_count > 7)
            {
                shadowAlpha = argument[7];
            }
        }
    }
}

draw_set_color(shadowColor);
draw_set_alpha(shadowAlpha);
draw_text_transformed(xPos,yPos+shadowOffset,text,scale,scale,0);

draw_set_color(textColor);
draw_set_alpha(1);
draw_text_transformed(xPos,yPos,text,scale,scale,0);
