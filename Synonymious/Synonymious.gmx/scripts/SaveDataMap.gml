var encodedMap = json_encode(Game.dataMap);

var file = file_text_open_write(string(Game.synonymLanguage)+"Data.txt");
file_text_write_string(file,encodedMap);
file_text_close(file);
