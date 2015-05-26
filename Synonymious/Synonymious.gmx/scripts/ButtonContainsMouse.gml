var width = argument0;
var height = argument1;
if (mouse_x > xstart+5 - width/2 && 
    mouse_x < xstart+5 + width/2 &&
    mouse_y > ystart+5 - height/2 &&
    mouse_y < ystart+5 + height/2)
{
    return true;
}
return false;
