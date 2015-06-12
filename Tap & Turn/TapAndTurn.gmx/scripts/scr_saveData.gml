str = argument0;
fileName = argument1;
kind = argument2;
p1 = "";
p2 = "";
p3 = "";
if (file_exists(fileName))
{
    file = file_text_open_read(fileName);
    p1 = file_text_read_string(file);
    file_text_readln(file);
    p2 = file_text_read_string(file);
    file_text_readln(file);
    p3 = file_text_read_string(file);
    file_text_close(file);
}

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

enc = scr_encrypt(str);
if (kind == 0) {p1 = enc;}
if (kind == 1) {p2 = enc;}
if (kind == 2) {p3 = enc;}

for (var i=1;i<=30;i++)
{
    if (i mod 3 == 1 && i<=15)
    {
        if (p1 != "")
        {
            p1 = string_insert(chr(random_range(20,200)),p1,i);
        }
    }
    if (i mod 2 == 1 || i mod 3 == 0)
    {
        if (p2 != "")
        {
            p2 = string_insert(chr(random_range(20,200)),p2,i);
        }
    }
    if (i mod 2 == 0 || i mod 3 == 1)
    {
        if (p3 != "")
        {
            p3 = string_insert(chr(random_range(20,200)),p3,i);
        }
    }
}

//encrypt string and save in game.rar
file = file_text_open_write(fileName);
file_text_write_string(file,p1);
file_text_writeln(file);
file_text_write_string(file,p2);
file_text_writeln(file);
file_text_write_string(file,p3);
file_text_close(file);
//encrypt string and save in game.rar

//Generate hash code from game.rar --> encrypt it and save it in data.rar
hash = sha1_file(fileName);
encHash = scr_encrypt(hash);
file_text_open_write(fileName);
file_text_write_string(file,p1);
file_text_writeln(file);
file_text_write_string(file,p2);
file_text_writeln(file);
file_text_write_string(file,p3);
file_text_writeln(file);
file_text_write_string(file,encHash);
file_text_close(file);
//Generate hash code from game.rar --> encrypt it and save it in data.rar