var str = argument0;
str = base64_encode(str);
for (var i=1;i<=string_length(str);i+=2)
{
    str = string_set_byte_at(str,i,string_byte_at(str,i)-27);
}
str = base64_encode(str);
for (var i=2;i<=string_length(str);i+=2)
{
    str = string_set_byte_at(str,i,string_byte_at(str,i)-29);
}

return str;