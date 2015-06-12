var file;
var fileText;
var fileName = argument0;
var newFileName;
var savedHash;
var i;

if (file_exists(fileName))
{
    newFileName = "CopyOf"+fileName;
    file_copy(fileName,newFileName);
    file = file_text_open_read(newFileName);
    i=0;
    while (!file_text_eof(file))
    {
        fileText[i] = file_text_read_string(file);
        file_text_readln(file);
        i++;
    }
    file_text_close(file);
    
    file = file_text_open_write(newFileName);
    for (i=0;i<array_length_1d(fileText)-1;i++)
    {
        file_text_write_string(file,fileText[i]);
    }
    file_text_close(file);

    currentHash = sha1_file(newFileName);
    savedHash = Decrypt(fileText[array_length_1d(fileText)-1]);
    
    file_delete(newFileName);
    if (currentHash == savedHash)
    {
        return false;
    }
    else
    {
        file_delete(fileName);
        show_message(fileName);
        show_message("The save file seems to be changed. If you believe this is a mistake, please report this to a developer.");
        return true;
    }
}
else
{
    return false;
}
