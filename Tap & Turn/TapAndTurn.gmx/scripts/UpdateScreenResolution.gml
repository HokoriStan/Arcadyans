application_surface_enable(false);
/*
if (os_type == os_windows)
{
    room_set_view(rm_game,0,true,0,0,room_width,room_height,0,0,room_width,room_height,0,0,0,0,noone);
    exit;
}

device_w = round(display_get_width());
device_h = round(display_get_height());

game_w = room_width;
game_h = room_height;

device_aspect = device_w / device_h;
game_aspect = game_w / game_h;

if (device_aspect/game_aspect >= 1)
{
    room_set_width(rm_game,room_height*device_w/device_h);
    room_w=room_height*device_w/device_h;
    room_h=room_height;
}
else
{
    room_set_height(rm_game,room_width*device_h/device_w);
    room_w=room_width;
    room_h=room_width*device_h/device_w;
}
window_set_size(device_w, device_h);
room_set_view(rm_game,0,true,0,0,room_w,room_h,0,0,room_w,room_h,0,0,0,0,noone);