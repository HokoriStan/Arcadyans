var dir = argument0;
var instance = instance_create(0,0,obj_surfaceCopy);
instance.dir = dir;
with (instance)
{
    event_perform(ev_step,0);
}
