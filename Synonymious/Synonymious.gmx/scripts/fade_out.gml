///fade_out()
if image_alpha <= alpha
    {
    image_alpha -=0.01
    }
if image_alpha <= 0
    {
    instance_destroy();
    }
