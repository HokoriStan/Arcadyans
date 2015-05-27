var text = argument[0];
var question = false;
var action = -1;
if (argument_count > 1)
{
    question = argument[1];
    if (argument_count > 2)
    {
        action = argument[2];
    }
}
var instance = instance_create(room_width/2,440,obj_message);
instance.text = text;
instance.question = question;
instance.action = action;
instance.initialized = true;
