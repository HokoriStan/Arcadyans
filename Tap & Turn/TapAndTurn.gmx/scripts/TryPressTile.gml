with (argument0)
{
    if (!Game.levelCompleted && 
        !Game.notEnoughTaps && 
        !Game.notEnoughTime &&
        !Game.bombExploded && 
        !instance_exists(obj_levelStartBar) && 
        !instance_exists(obj_gestureTouch) && 
        !instance_exists(obj_upDownMessage)
        )
    {
        with (obj_tile)
        {
            if (turn != 0)
            {
                return false;
            }
        }
        obj_tapsLeft.tapsLeft -= 1;
        obj_buttonUndo.image_alpha = 1;
        audio_play_sound(snd_tilePressed, 0, false);
        if (ds_list_size(Game.undoList) >= Game.maxUndos)
        {
            ds_list_delete(Game.undoList,0);
        }
        ds_list_add(Game.undoList,id);
        ds_list_add(Game.solutionList,id.arrayIndex);
        if (Game.devModeOn)
        {
            id.turn = -1;
            ChangeColorIndex(id);
        }
        else
        {
            TurnTiles(id);
        }
        return true;
    }
}
