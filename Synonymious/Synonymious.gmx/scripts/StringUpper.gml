var stringUpper = "";
for (var i=0;i<string_length(argument0);i++)
{
    var byteVal = ord(string_copy(argument0,i+1,1));
    if ( (byteVal >= 97 && byteVal <= 122) || byteVal >= 224)
    {
        byteVal -= 32;
    }
    stringUpper += chr(byteVal);
}
return stringUpper;
