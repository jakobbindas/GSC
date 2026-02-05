json_add(filename)
{
    if (!IsDefined(level.json_structs)) {
        level.json_structs = [];
    }
    level.json_structs[filename] = ShieldFromJson(filename);
    return level.json_structs[filename];
}

json_get(filename)
{
    if (!IsDefined(level.json_structs) || !IsDefined(level.json_structs[filename])) {
        json_add(filename);
    }
    return level.json_structs[filename];
}

json_from_path(filename, json_path)
{
    json = json_get(filename);
    tokens = StrTok(json_path, ".");
    foreach (token in tokens) {
        if (!IsDefined(json.(token))) {
            return undefined;
        }
        json = json.(token);
    }
    return json;
}