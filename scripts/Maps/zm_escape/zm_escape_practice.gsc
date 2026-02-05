zm_escape_quest_init()
{
    switch (level.patch_settings.patch) {
        case "boss": {
            thread override_quest("paschal_quest", "1", &empty_func, &empty_func);
            thread override_quest("paschal_quest", "2", &empty_func, &empty_func);
            thread override_quest("paschal_quest", "3", &empty_func, &empty_func);
            thread override_quest("paschal_quest", "4", &empty_func, &empty_func);
            break;
        }
        case "chals": {
            thread override_quest("paschal_quest", "1", &paschal_step_1);
            thread override_quest("paschal_quest", "2", &paschal_step_2);
            thread override_quest("paschal_quest", "4", &paschal_step_4);
            break;
        }
        case "birds": {
            self thread override_quest("paschal_quest", "1", &paschal_step_1);
            break;
        }
        default: {
            return;
        }
    }
}

zm_escape_practice()
{
    switch (level.patch_settings.patch) {
        case "boss":
        case "chals": {
            self thread zm_escape_challenge_setup();
            break;
        }
        case "birds": {
            self thread zm_escape_birds_setup();
            break;
        }
    }
}