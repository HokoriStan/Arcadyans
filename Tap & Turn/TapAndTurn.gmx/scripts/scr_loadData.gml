fileName = argument0;
kind = argument1;

//p1 = "";
//p2 = "";
//p3 = "";
if (file_exists(fileName))
{
    file = file_text_open_read(fileName);
    p1 = file_text_read_string(file);
    file_text_readln(file);
    p2 = file_text_read_string(file);
    file_text_readln(file);
    p3 = file_text_read_string(file);
    file_text_readln(file);
    p4 = file_text_read_string(file);
    file_text_close(file);
}

file = file_text_open_write(fileName);
file_text_write_string(file,p1);
file_text_writeln(file);
file_text_write_string(file,p2);
file_text_writeln(file);
file_text_write_string(file,p3);
file_text_close(file);

decHash = scr_decrypt(p4);

//Checks is the file has been changed by checking the current hashcode and the hashcode stored inside the data file
if (decHash != sha1_file(fileName))
{
    file_delete(fileName);
    show_message("The save file seems to be changed. If you think this is a mistake, please report this to a developer.");
    //show_message("Hash now = "+sha1_file(fileName)+"#
    //              Hash read = "+decHash);
    game_end();
    exit;
}
//Checks is the file has been changed by checking the current hashcode and the hashcode stored inside the data file

file_text_open_write(fileName);
file_text_write_string(file,p1);
file_text_writeln(file);
file_text_write_string(file,p2);
file_text_writeln(file);
file_text_write_string(file,p3);
file_text_writeln(file);
file_text_write_string(file,p4);
file_text_close(file);

dec = "-:";

for (var i=30;i>=1;i--)
{
    if (i mod 3 == 1 && i<=15)
    {
        if (p1 != "")
        {
            p1 = string_delete(p1,i,1);
        }
    }
    if (i mod 2 == 1 || i mod 3 == 0)
    {
        if (p2 != "")
        {
            p2 = string_delete(p2,i,1);
        }
    }
    if (i mod 2 == 0 || i mod 3 == 1)
    {
        if (p3 != "")
        {
            p3 = string_delete(p3,i,1);
        }
    }
}

switch (kind)
{
    case 0: if (p1 != "") {dec = scr_decrypt(p1);} break;
    case 1: if (p2 != "") {dec = scr_decrypt(p2);} break;
    case 2: if (p3 != "") {dec = scr_decrypt(p3);} break;
}
return dec;