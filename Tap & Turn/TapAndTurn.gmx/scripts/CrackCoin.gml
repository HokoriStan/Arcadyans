var explode = true;
var awayFromX;
var awayFromY;
var X = obj_tapsLeft.x;
var Y = obj_tapsLeft.y;
if (argument_count > 0)
{
    var explode = argument[0];
}
if (explode)
{
    obj_tapsLeft.image_index ++;
    
    awayFromX[0] = X-10;
    awayFromY[0] = Y+10;
    
    awayFromX[1] = X-1;
    awayFromY[1] = Y+10;
    
    awayFromX[2] = X+10;
    awayFromY[2] = Y+10;
    
    awayFromX[3] = X+10;
    awayFromY[3] = Y-1;
    
    awayFromX[4] = X+1;
    awayFromY[4] = Y-10;
    
    awayFromX[5] = X-1;
    awayFromY[5] = Y-10;
    
    awayFromX[6] = X-10;
    awayFromY[6] = Y;
}
else
{//192
    awayFromX[0] = X+102.53;
    awayFromY[0] = Y-102.53;
    
    awayFromX[1] = X+14.43;
    awayFromY[1] = Y-144.28;
    
    awayFromX[2] = X-102.53;
    awayFromY[2] = Y-102.53;
    
    awayFromX[3] = X-144.28
    awayFromY[3] = Y+14.43;
    
    awayFromX[4] = X-14.43;
    awayFromY[4] = Y+144.28;
    
    awayFromX[5] = X+14.43;
    awayFromY[5] = Y+144.28;
    
    awayFromX[6] = X+145;
    awayFromY[6] = Y;
    /*awayFromX[0] = 294.53;
    awayFromY[0] = 47.47;
    
    awayFromX[1] = 206.43;
    awayFromY[1] = 5.72;
    
    awayFromX[2] = 89.47;
    awayFromY[2] = 47.47;
    
    awayFromX[3] = 47.72;
    awayFromY[3] = 164.43;
    
    awayFromX[4] = 177.57;
    awayFromY[4] = 294.28;
    
    awayFromX[5] = 206.43;
    awayFromY[5] = 294.28;
    
    awayFromX[6] = 337;
    awayFromY[6] = 150;*/
}
    
for (var i=0;i<7;i++)
{
    var inst;
    if (explode)
    {
        inst = instance_create(X,Y,obj_brokenCoin);
        inst.image_index = i;
        inst.moveSpeed = 5;
        inst.awayFromX = awayFromX[i];
        inst.awayFromY = awayFromY[i];
    }
    else
    {
        inst = instance_create(awayFromX[i],awayFromY[i],obj_brokenCoin);
        inst.image_index = i;
        inst.moveSpeed = -5;
        inst.awayFromX = X;
        inst.awayFromY = Y;
        inst.image_alpha = 0;
    }   
    
    var imageIndex = obj_tapsLeft.image_index;
    if ((explode && imageIndex == 1) || (!explode && imageIndex == 1))
    {
        inst.sprite_index = spr_goldCoinBroken;
    }
    else if ((explode && imageIndex == 2) || (!explode && imageIndex == 2))
    {
        inst.sprite_index = spr_silverCoinBroken;
    }
    else
    {
        inst.sprite_index = spr_bronzeCoinBroken;
        drawSelf = false;
    }
}
