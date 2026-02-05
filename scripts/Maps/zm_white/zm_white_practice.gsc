zm_white_quest_init()
{
    switch (level.patch_settings.patch) {
        case "boss": {
            // thread override_quest("zm_white_main_quest", "1", &white_main_quest_step1, &empty_func);
            // thread override_quest("zm_white_main_quest", "2", &empty_func, &empty_func);
            // thread override_quest("zm_white_main_quest", "3", &empty_func, &empty_func);
            // thread override_quest("zm_white_main_quest", "4", &empty_func, &empty_func);
            // thread override_quest("zm_white_main_quest", "5", &empty_func, &empty_func);
            // thread override_quest("zm_white_main_quest", "6", &white_main_quest_step6_setup, &empty_func);        // Step 7 is boss fight
            break;
        }

        default: {
            return;
        }
    }
}

zm_white_practice()
{
    switch (level.patch_settings.patch) {
        case "boss": {
            self thread zm_white_boss_setup();
            break;
        }
    }
}