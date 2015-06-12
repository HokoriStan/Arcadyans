x = 320;
y = 700;
surf = surface_create(room_width,room_height);
surface_set_target(surf);
with (obj_buttonLevel)
{
    var prefXScale = image_xscale;
    var prefYScale = image_yscale;
    image_xscale = 1.2;
    image_yscale = 1.2;
    image_blend = Game.color_black;
    draw_self();
    image_xscale = prefXScale;
    image_yscale = prefYScale;
}

draw_set_color(c_white);
draw_text_transformed(room_width/2,room_height/4,text,0.55,0.55,0);
draw_sprite_ext(spr_lockBig,0,380,600,1,1,0,c_white,1);
var scale = 0.75;
draw_sprite_ext(spr_coin,2,x+40,y,scale,scale,0,c_white,1);
draw_sprite_ext(spr_coin,1,x,y,scale,scale,0,c_white,1);
draw_sprite_ext(spr_coin,0,x-40,y,scale,scale,0,c_white,1);
draw_set_color(Game.color_black);
draw_text_transformed(x+170,y,string(requiredCoins),0.9,0.9,0);
//sprite = (sprite_create_from_surface(surf,0,0,room_width,room_height,false,false,0,0));
surface_reset_target();
//return sprite;
