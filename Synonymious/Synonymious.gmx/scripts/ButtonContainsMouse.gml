if (instance_exists(obj_message))
{
    return false;
}
var width = argument0;
var height = argument1;
if (mouse_x > xstart+5 - width/2 && 
    mouse_x < xstart+5 + width/2 &&
    mouse_y > ystart+5 - height/2 &&
    mouse_y < ystart+5 + height/2)
{
    Game.drag = false;
    return true;
}
return false;
