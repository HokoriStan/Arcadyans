var surface;
var text = argument0;

surface = DrawButton(x,y,string_width(text),string_height(text));
spriteIndex = sprite_create_from_surface(surface,0,0,surface_get_width(surface),surface_get_height(surface),false,false,surface_get_width(surface)/2,surface_get_height(surface)/2-9);
sprite_index = spriteIndex;
image_index = 1;
surface = DrawButton(x,y,string_width(text),string_height(text));
sprite_add_from_surface(sprite_index,surface,0,0,surface_get_width(surface),surface_get_height(surface),false,false);
image_index = 0;
