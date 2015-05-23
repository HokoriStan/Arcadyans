var sur = argument0;
if (mouse_x > xstart - surface_get_width(sur)/2 && 
    mouse_x < xstart + surface_get_width(sur)/2 &&
    mouse_y > ystart - surface_get_height(sur)/2 &&
    mouse_y < ystart + surface_get_height(sur)/2)
{
    return true;
}
return false;
