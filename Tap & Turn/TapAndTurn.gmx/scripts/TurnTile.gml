var ID = argument0;
with (ID)
{
    var turnSpeed = argument1;
    turnWaitTime -= 1/room_speed;
    if (turnWaitTime <= 0)
    {
        turnWaitTime = 0;
        image_xscale += (turnSpeed*startImageXScale)/room_speed*turn;
        if (turn == -1)
        {
            if (image_xscale <= 0)
            {
                image_xscale = 0;
                if (Game.gotoRoom != -1 || Game.loadLevel || Menu.turningPage)
                {
                    turn = 0;
                }
                else
                {
                    turn = 1;
                }
            }
        }
        else if (turn == 1 && image_xscale >= startImageXScale)
        {
            image_xscale = startImageXScale;
            turn = 0;
        }
    }
}
