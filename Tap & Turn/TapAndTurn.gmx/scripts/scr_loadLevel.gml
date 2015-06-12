if (argument0 == 0)
{
    str = scr_loadData("data.rar",argument1);
    nPos = string_pos(":",str);
    levelString = string_copy(str,1,nPos-1);
    if (levelString == "-")
    {
        return false;
    }
    level = real(levelString);
    str = string_delete(str,1,nPos);
    nPos = string_pos(":",str);
    boardSize = real(string_copy(str,1,nPos-1));
    str = string_delete(str,1,nPos);
    loadLevel = true;
    room_goto(rm_game);
    return true;
}
if (argument0 == 1)
{
    loadLevel = false;
    with (obj_panel)
    {
        instance_destroy();
    }
    with (obj_frozenPanel)
    {
        instance_destroy();
    }
    counter = 0;
    str = scr_loadData("data.rar",argument1);
    nPos = string_pos(":",str);
    str = string_delete(str,1,nPos);
    nPos = string_pos(":",str);
    str = string_delete(str,1,nPos);
    
    nPos = string_pos(":",str);
    time = real(string_copy(str,1,nPos-1));
    str = string_delete(str,1,nPos);
    
    nPos = string_pos(":",str);
    swipes = real(string_copy(str,1,nPos-1));
    str = string_delete(str,1,nPos);
    
    nPos = string_pos(":",str);
    points = real(string_copy(str,1,nPos-1));
    str = string_delete(str,1,nPos);
    
    nPos = string_pos(":",str);
    shuffleSwipes = real(string_copy(str,1,nPos-1));
    str = string_delete(str,1,nPos);
    
    nPos = string_pos(":",str);
    reverseDirectionSwipes = real(string_copy(str,1,nPos-1));
    str = string_delete(str,1,nPos);
    
    nPos = string_pos(":",str);
    randomMovesSwipes = real(string_copy(str,1,nPos-1));
    str = string_delete(str,1,nPos);
    
    for (var i=0;i<boardSize;i++)
    {
        for (var q=0;q<boardSize;q++)
        {
            if (board[i,q] != -2)
            {
                board[i,q] = -1;
            }
        }
    }
    while (string_length(str) > 1)
    {
        nPos = string_pos(":",str);
        kind = real(string_copy(str,1,nPos-1));
        str = string_delete(str,1,nPos);
        nPos = string_pos(":",str);
        number = real(string_copy(str,1,nPos));
        str = string_delete(str,1,nPos);
        if (kind != 0)
        {
            i = counter div 5;
            q = counter mod 5;
            if (i < boardSize && q < boardSize)
            {
                if (kind == 1)
                {
                    board[i,q] = instance_create(borderX+panelSize*i+sprite_get_width(spr_panel)/2,borderY+panelSize*q+sprite_get_height(spr_panel)/2,obj_panel);
                    board[i,q].number = number;
                    if (number > highestNumber)
                    {
                        number = highestNumber;
                    }
                }
                else if (kind == 2)
                {
                    board[i,q] = instance_create(borderX+panelSize*i+sprite_get_width(spr_panel)/2,borderY+panelSize*q+sprite_get_height(spr_panel)/2,obj_frozenPanel);
                    board[i,q].number = number;
                }
            }
        }
        str = string_delete(str,1,2);
        counter ++;
    }
}