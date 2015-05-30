file_delete(string(Game.synonymLanguage)+"Data.txt");
TryLoadDataMap();
switch (Game.language)
{
    case "English": text = "Progress deleted.";     break;
    case "Dutch":   text = "Voortgang verwijderd."; break;
    case "French":  text = "Progrès Supprimés.";    break;
    case "Swedish": text = "Framsteg utgå.";        break;
}
ShowMessage(text);
