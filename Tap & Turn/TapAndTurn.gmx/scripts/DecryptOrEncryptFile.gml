var encrypt = 0;
var decrypt = 1;
var decryptOrEncrypt = argument1;

var fileName = argument0;
var fileText = -1;
var hash;
var i = 0;

if (file_exists(fileName))
{
    file = file_text_open_read(fileName);
    while (!file_text_eof(file))
    {
        fileText[i] = file_text_read_string(file);
        file_text_readln(file);
        i++;
    }
    file_text_close(file);
    
    var data = "";
    if (decryptOrEncrypt == decrypt)
    {
        for (i=0;i<array_length_1d(fileText)-1;i++)
        {
            data+=fileText[i];
            if (i != array_length_1d(fileText)-2)
            {
                data+=chr(10);
            }
        }
        data = Decrypt(data);
    }
    else if (decryptOrEncrypt == encrypt)
    {
        for (i=0;i<array_length_1d(fileText);i++)
        {
            data+=fileText[i];
            if (i != array_length_1d(fileText)-1)
            {
                data+=chr(10);
            }
        }
        data = Encrypt(data);
    }
    
    file = file_text_open_write(fileName);
    file_text_write_string(file,data);
    file_text_close(file);
    
    if (decryptOrEncrypt == encrypt)
    {
        hash = sha1_file(fileName);
        
        file = file_text_open_write(fileName);
        file_text_write_string(file,data);
        file_text_writeln(file);
        file_text_write_string(file,Encrypt(hash));
        file_text_close(file);
    }
}