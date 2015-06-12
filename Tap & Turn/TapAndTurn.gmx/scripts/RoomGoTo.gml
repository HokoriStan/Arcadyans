Game.gotoRoom = argument0;
ResetTurnWaitTime(true);
with (obj_turnable)
{
    turn = -1;
}
audio_play_sound(snd_tilePressed, 0, false);
