if (speed > 0)
{
    move_towards_point(bombX,bombY,-speed);
    speed -= 60/room_speed;
    image_angle += rotateSpeed;
    /*if (rotateSpeed > 0)
    {
        rotateSpeed -= 6/room_speed;
    }
    else
    {
        rotateSpeed += 6/room_speed;
    }*/
    image_alpha -= 0.5/room_speed;
}