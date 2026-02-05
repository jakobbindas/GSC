zm_white_boss_setup() {
    IPrintLnBold("AO Boss Rush");

    // Take all weapons
    foreach (weapon in self GetWeaponsListPrimaries()) {
        self TakeWeapon(weapon);
    }

    // Give pap spit and mk2
    self zm_weapons::weapon_give(GetWeapon("smg_fastfire_t8_upgraded"), 0, 1, 334);
    self zm_weapons::weapon_give(GetWeapon("ray_gun_mk2_upgraded"));

    // Open all doors
    thread zombie_open_sesame();

    SetSlowMotion(1, 10, 0.05);
    wait 20;
    goto_round(8);
    wait 20;
    SetSlowMotion(10, 1, 0.05);

    /*
    * Note from Bindy: The following code was developed by aidanolf to get boss fight working. I added
    * comments to what I think each call does, but give full credit to him for getting this working. 
    */

    // Activate rishmore
    level flag::set( #"mq_computer_activated" );

    // Start boss step
    level [[ @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::function_cae70bde ]]();
    
    // Start timer when player interacts with console
    level thread start_timer_after_delay();

    // Allow for step 7 to start & update ui
    level flag::set( #"hash_487c2805cd41d547" );
    level zm_ui_inventory::function_7df6bb60( #"zm_white_breakfast_trial", 7 );

    // bunker to solitary and storage doors
    level [[ @zm_white_util<scripts\zm\zm_white_util.gsc>::function_364cd8c0 ]]("bunker_power_event_storage");
    level [[ @zm_white_util<scripts\zm\zm_white_util.gsc>::function_364cd8c0 ]]("bunker_power_event_solitary");


    // ---- IMPORTANT: DO NOT CALL step7_cleanup (it force-fills / sets ready)
    // Instead: teleport only (safe)
    level thread zm_white_tp_to_console();

    // Start the APD flow that waits for YOU to fill it
    level thread [[ @zm_white_toast<scripts\zm\zm_white_toast.gsc>::function_94c0714 ]]();

    // When APD becomes charged, move to step8 (boss start flow)
    level thread zm_white_wait_then_start_step8();

    // Handle shard to end game
    level thread wait_for_boss_complete();
}

start_timer_after_delay() {
    IPrintLnBold("Starting timer in...");
    time_until_timer_start = 3;
    while (time_until_timer_start > 0) {
        IPrintLnBold(time_until_timer_start);
        time_until_timer_start--;
        wait 1;
    }
    level clientfield::set_world_uimodel("ZMHudGlobal.trials.gameStartTime", GetTime());
}

wait_for_boss_complete() {
    // level flag::set("boss_fight_complete");
    level flag::wait_till(#"boss_fight_complete");

    level thread [[ @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step9_setup ]]( 0 );
    level flag::wait_till(#"hash_5aa1c9627e8626e0");
    level thread [[ @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step9_cleanup ]]( 0, 0 );
}

zm_white_tp_to_console()
{
    level endon("end_game");

    // enable the zone
    level flag::set( "bunker_boss_event" );
    zm_zonemgr::enable_zone( "zone_bunker_apd" );

    // wait until respawn points exist (prevents crash)
    a_s_respawn_points = undefined;
    while ( !isdefined(a_s_respawn_points) || a_s_respawn_points.size < 1 )
    {
        a_s_respawn_points = struct::get_array( "zone_bunker_apd_respawn", "targetname" );
        waitframe(1);
    }

    a_e_players = getplayers();

    // teleport safely (don’t index past array size)
    for ( i = 0; i < a_e_players.size && i < a_s_respawn_points.size; i++ )
    {
        a_e_players[i] setorigin( a_s_respawn_points[i].origin );
    }
}

zm_white_wait_then_start_step8()
{
    level endon("end_game");

    // iprintlnbold("BOSS DBG: waiting for APD charged flag");

    /*
    * Note to user: Should you ever want to skip the soul collection step, just uncomment this code snippet and 
    * replace the level flag::waittill line.
    
    wait 10;
    
    soul_counter = 0;
    s_apd = struct::get("cp_toast_apd", "script_noteworthy");
    while (soul_counter < 29) {
        s_apd.n_captured++;
        soul_counter++;

        level notify(#"toast_captured");
        wait 0.1;
    }
    s_apd.charged = 1;
    level flag::set( #"hash_2b7c76b6b0dfc0fd" );

    */

    level flag::wait_till( #"hash_2b7c76b6b0dfc0fd" );

    // iprintlnbold("BOSS DBG: APD charged -> starting step8");
    level thread [[ @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step8_setup ]]( 0 );
    
    IPrintLnBold("Souls collected, skipping cutscene");

    // Freeze controls during cutscene
    foreach (player in level.activeplayers) {
        player FreezeControls(1);
    }

    // Fast forward through cutscene
    SetSlowMotion(1, 10, 0.05);
    wait 90;
    SetSlowMotion(10, 1, 0.05);

    // Unfreeze
    foreach (player in level.activeplayers) {
        player FreezeControls(0);
    }
}

monitor_coords() {
    self endon("disconnect");
    player = level.players[0];

    while (true) {
        iPrintLn("Player: " + player.origin[0] + ", " + player.origin[1] + ", " + player.origin[2]);
        wait 1;
    }
    
}