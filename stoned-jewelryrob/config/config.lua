Config = {}

--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

Config.Framework = 'esx' -- [ 'esx' / 'qb' ]
Config.Language = "en" -- Language to use.  [ 'en' / pt' / 'fr' / 'de' ]  



--░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗
--██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║
--██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║
--██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║
--╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
--░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

Config.Cooldown = 10 -- (Minutes)    Cool Down Timer. Everyone will wait X mins for the next atm to become avaiable to rob.
Config.MinimumPoliceToRob = 0 -- Minium Ammount of Police need to be on duty.
Config.TutorialRobbery = true -- Heist demonstration active?
Config.RobOnlyAtNight = false -- Do you want atm robbery to be allowed only at night?


------------------------
--- REWARD PAINTINGS ---
------------------------
Config.PaintingAmount = 1 -- number of paintings you receive for each
Config.ItemPaint = 'painting' -- item name (need this item created)

------------------------
--- REWARD JEWELS ---
------------------------
Config.Rewards = {
    amount = {1, 3}, -- random amount (interval)

    --item name (need this items created)    &   label for notif
    { item = "clock", name = "Stolen Clock(s)" },
    { item = "bracelet", name = "Stolen Bracelet(s)" },
    { item = "ring", name = "Stolen Ring(s)" },
    { item = "chain", name = "Stolen Necklace(s)" },
    { item = "earrings", name = "Stolen Earring(s)" }
}


--██████╗ ██╗     ██╗██████╗ ███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ █████╗ ██╗     ██╗     ███████╗██╗ ██████╗ ███╗   ██╗
--██╔══██╗██║     ██║██╔══██╗██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔══██╗██║     ██║     ██╔════╝██║██╔════╝ ████╗  ██║
--██████╔╝██║     ██║██████╔╝███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ███████║██║     ██║     ███████╗██║██║  ███╗██╔██╗ ██║
--██╔══██╗██║     ██║██╔═══╝ ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██╔══██║██║     ██║     ╚════██║██║██║   ██║██║╚██╗██║
--██████╔╝███████╗██║██║     ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗██║  ██║███████╗███████╗███████║██║╚██████╔╝██║ ╚████║
--╚═════╝ ╚══════╝╚═╝╚═╝     ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝      

Config.Dispatch = {
    Enable = true, --Do you want to activate the police alert system (dispatch)? Is not, put false
    ChanceToAlertPolice = 100, -- Chance to alert police (1-100%)
    Type = 'standalone', --[ 'standalone' / 'cd_dispatch' / 'linden_alerts' / 'qb_defaultalert'] -- You can add more in config/functions.lua
  
    BlipSprite = 161,
    BlipColor = 1,
    BlipScale = 2.0,
}


 --███╗   ███╗ █████╗ ██╗███╗   ██╗    ██╗      ██████╗  ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
 --████╗ ████║██╔══██╗██║████╗  ██║    ██║     ██╔═══██╗██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
 --██╔████╔██║███████║██║██╔██╗ ██║    ██║     ██║   ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
 --██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║     ██║   ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
 --██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ███████╗╚██████╔╝╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
 --╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

Locations = {
    ['vangrob_start'] = vec3(-629.3083, -230.7710, 38.6570) -- Local to start robbery
}

Config.NPCSecurity = {
    Enable = true,
    PedName = "s_m_m_highsec_01",
    Location = {x = -633.2793, y = -237.2233, z = 38.0372, heading = 154.5534},

    NpcWithWeapon = true,
    WeaponName = "weapon_pistol"
}

Config['ArtHeist'] = {
    ['painting'] = {
        {
            scenePos = vector3(-626.70, -228.3, 38.06), -- animation coords
            sceneRot = vector3(0.0, 0.0, 90.0), -- animation rotation
            object = 'ch_prop_vault_painting_01e', -- object (https://mwojtasik.dev/tools/gtav/objects/search?name=ch_prop_vault_painting_01)
            objectPos = vector3(-627.20, -228.31, 38.06), -- object spawn coords
            objHeading = 94.75 -- object spawn heading
        },
        {
            scenePos = vector3(-622.97, -225.64, 38.06), 
            sceneRot = vector3(0.0, 0.0, -20.0),
            object = 'ch_prop_vault_painting_01i', 
            objectPos = vector3(-622.80, -225.14, 38.06), 
            objHeading = 345.85
        },
        {
            scenePos = vector3(-617.48, -233.22, 38.06), 
            sceneRot = vector3(0.0, 0.0, -90.0),
            object = 'ch_prop_vault_painting_01h', 
            objectPos = vector3(-617.00, -233.22, 38.06), 
            objHeading = 269.53
        },
        {
            scenePos = vector3(-621.25, -235.78, 38.06), 
            sceneRot = vector3(0.0, 0.0, 160.0),
            object = 'ch_prop_vault_painting_01j', 
            objectPos = vector3(-621.25, -236.38, 38.06), 
            objHeading = 161.22
        },
        {
            scenePos = vector3(1397.586, 1165.579, 113.4136), 
            sceneRot = vector3(0.0, 0.0, 90.0),
            object = 'ch_prop_vault_painting_01f', 
            objectPos = vector3(1397.136, 1165.579, 114.5336), 
            objHeading = 90.0
        },
        {
            scenePos = vector3(1397.976, 1165.679, 113.4136), 
            sceneRot = vector3(0.0, 0.0, 0.0),
            object = 'ch_prop_vault_painting_01g', 
            objectPos = vector3(1397.936, 1166.079, 114.5336), 
            objHeading = 0.0
        },
    },
    ['objects'] = { 
        'hei_p_m_bag_var22_arm_s',
        'w_me_switchblade'
    },
    ['animations'] = { 
        {"top_left_enter", "top_left_enter_ch_prop_ch_sec_cabinet_02a", "top_left_enter_ch_prop_vault_painting_01a", "top_left_enter_hei_p_m_bag_var22_arm_s", "top_left_enter_w_me_switchblade"},
        {"cutting_top_left_idle", "cutting_top_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_idle_ch_prop_vault_painting_01a", "cutting_top_left_idle_hei_p_m_bag_var22_arm_s", "cutting_top_left_idle_w_me_switchblade"},
        {"cutting_top_left_to_right", "cutting_top_left_to_right_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_to_right_ch_prop_vault_painting_01a", "cutting_top_left_to_right_hei_p_m_bag_var22_arm_s", "cutting_top_left_to_right_w_me_switchblade"},
        {"cutting_top_right_idle", "_cutting_top_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_right_idle_ch_prop_vault_painting_01a", "cutting_top_right_idle_hei_p_m_bag_var22_arm_s", "cutting_top_right_idle_w_me_switchblade"},
        {"cutting_right_top_to_bottom", "cutting_right_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_right_top_to_bottom_ch_prop_vault_painting_01a", "cutting_right_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_right_top_to_bottom_w_me_switchblade"},
        {"cutting_bottom_right_idle", "cutting_bottom_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_idle_ch_prop_vault_painting_01a", "cutting_bottom_right_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_idle_w_me_switchblade"},
        {"cutting_bottom_right_to_left", "cutting_bottom_right_to_left_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_to_left_ch_prop_vault_painting_01a", "cutting_bottom_right_to_left_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_to_left_w_me_switchblade"},
        {"cutting_bottom_left_idle", "cutting_bottom_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_left_idle_ch_prop_vault_painting_01a", "cutting_bottom_left_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_left_idle_w_me_switchblade"},
        {"cutting_left_top_to_bottom", "cutting_left_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_left_top_to_bottom_ch_prop_vault_painting_01a", "cutting_left_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_left_top_to_bottom_w_me_switchblade"},
        {"with_painting_exit", "with_painting_exit_ch_prop_ch_sec_cabinet_02a", "with_painting_exit_ch_prop_vault_painting_01a", "with_painting_exit_hei_p_m_bag_var22_arm_s", "with_painting_exit_w_me_switchblade"},
    },
}

JewelryShowcase = { --des_jewel_cab2_end, des_jewel_cab3_end, des_jewel_cab_end, des_jewel_cab4_end
	{ ['id'] = 1 , ['x'] = -626.3253 , ['y'] = -239.0511 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab2_end" , ['prop1'] = "des_jewel_cab2_start", ['xplayer'] = -626.80908203125, ['yplayer'] = -238.34339904785, ['zplayer'] = 38.057006835938, ['heading'] = 221.73 },
	{ ['id'] = 2 , ['x'] = -625.2751 , ['y'] = -238.2881 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab3_end" , ['prop1'] = "des_jewel_cab3_start", ['xplayer'] = -625.80285644531, ['yplayer'] = -237.60856628418, ['zplayer'] = 38.056999206543, ['heading'] = 221.73 },
	{ ['id'] = 3 , ['x'] = -626.5439 , ['y'] = -233.6047 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab_end" , ['prop1'] = "des_jewel_cab_start", ['xplayer'] = -627.08929443359, ['yplayer'] = -232.89517211914, ['zplayer'] = 38.057006835938, ['heading'] = 221.73 }, 
	{ ['id'] = 4 , ['x'] = -626.1613 , ['y'] = -234.1315 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab4_end" , ['prop1'] = "des_jewel_cab4_start", ['xplayer'] = -625.57720947266, ['yplayer'] = -234.80921936035, ['zplayer'] = 38.057010650635, ['heading'] = 31.56 },
	{ ['id'] = 5 , ['x'] = -627.2115 , ['y'] = -234.8942 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab3_end" , ['prop1'] = "des_jewel_cab3_start", ['xplayer'] = -626.64904785156, ['yplayer'] = -235.61465454102, ['zplayer'] = 38.05700302124, ['heading'] = 31.56 },
	{ ['id'] = 6 , ['x'] = -619.8483 , ['y'] = -234.9137 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab_end" , ['prop1'] = "des_jewel_cab_start", ['xplayer'] = -620.44061279297, ['yplayer'] = -234.19891357422, ['zplayer'] = 38.056999206543, ['heading'] = 221.73 },
	{ ['id'] = 7 , ['x'] = -617.0856 , ['y'] = -230.1627 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab2_end" , ['prop1'] = "des_jewel_cab2_start", ['xplayer'] = -617.83697509766, ['yplayer'] = -230.68539428711, ['zplayer'] = 38.057006835938, ['heading'] = 306.23 },
	{ ['id'] = 8 , ['x'] = -617.8492 , ['y'] = -229.1128 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab3_end" , ['prop1'] = "des_jewel_cab3_start", ['xplayer'] = -618.51141357422, ['yplayer'] = -229.69427490234, ['zplayer'] = 38.056999206543, ['heading'] = 306.23 },
	{ ['id'] = 9 , ['x'] = -621.5175 , ['y'] = -228.9474 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab3_end" , ['prop1'] = "des_jewel_cab3_start", ['xplayer'] = -620.89727783203, ['yplayer'] = -228.3892364502, ['zplayer'] = 38.057006835938, ['heading'] = 127.12 },
	{ ['id'] = 10 , ['x'] = -619.9662 , ['y'] = -226.198 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab_end" , ['prop1'] = "des_jewel_cab_start", ['xplayer'] = -620.61871337891, ['yplayer'] = -226.81732177734, ['zplayer'] = 38.057006835938, ['heading'] = 306.23 },
	{ ['id'] = 11 , ['x'] = -625.3300 , ['y'] = -227.3697 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab3_end" , ['prop1'] = "des_jewel_cab3_start", ['xplayer'] = -624.95703125, ['yplayer'] = -228.04200744629, ['zplayer'] = 38.057010650635, ['heading'] = 31.56 },
	{ ['id'] = 12 , ['x'] = -623.6147 , ['y'] = -228.6247 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab2_end" , ['prop1'] = "des_jewel_cab2_start", ['xplayer'] = -624.16003417969, ['yplayer'] = -227.90766906738, ['zplayer'] = 38.057006835938, ['heading'] = 221.73 },
	{ ['id'] = 13 , ['x'] = -623.9558 , ['y'] = -230.7263 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab4_end" , ['prop1'] = "des_jewel_cab4_start", ['xplayer'] = -624.64788818359, ['yplayer'] = -231.24926757813, ['zplayer'] = 38.057006835938, ['heading'] = 306.23 },
	{ ['id'] = 14 , ['x'] = -624.2796 , ['y'] = -226.6066 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab4_end" , ['prop1'] = "des_jewel_cab4_start", ['xplayer'] = -623.79742431641, ['yplayer'] = -227.30368041992, ['zplayer'] = 38.05700302124, ['heading'] = 31.56 },
	{ ['id'] = 15 , ['x'] = -619.2031 , ['y'] = -227.2482 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab2_end" , ['prop1'] = "des_jewel_cab2_start", ['xplayer'] = -619.91357421875, ['yplayer'] = -227.81005859375, ['zplayer'] = 38.057006835938, ['heading'] = 306.23 },
	{ ['id'] = 16 , ['x'] = -620.1764 , ['y'] = -230.7865 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab_end" , ['prop1'] = "des_jewel_cab_start", ['xplayer'] = -619.44543457031, ['yplayer'] = -230.30876159668, ['zplayer'] = 38.057022094727, ['heading'] = 127.12 },
	{ ['id'] = 17 , ['x'] = -620.5214 , ['y'] = -232.8823 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab4_end" , ['prop1'] = "des_jewel_cab4_start", ['xplayer'] = -620.04870605469, ['yplayer'] = -233.48422241211, ['zplayer'] = 38.057006835938, ['heading'] = 31.56 },
	{ ['id'] = 18 , ['x'] = -622.6159 , ['y'] = -232.5636 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab_end" , ['prop1'] = "des_jewel_cab_start", ['xplayer'] = -623.3056640625, ['yplayer'] = -233.11682128906, ['zplayer'] = 38.057010650635, ['heading'] = 306.23 },
	{ ['id'] = 19 , ['x'] = -627.5945 , ['y'] = -234.3678 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab_end" , ['prop1'] = "des_jewel_cab_start", ['xplayer'] = -628.11602783203, ['yplayer'] = -233.64642333984, ['zplayer'] = 38.057010650635, ['heading'] = 221.73 },
	{ ['id'] = 20 , ['x'] = -618.7984 , ['y'] = -234.1509 , ['z'] = 37.64523 , ['prop2'] = "des_jewel_cab3_end" , ['prop1'] = "des_jewel_cab3_start", ['xplayer'] = -619.36053466797, ['yplayer'] = -233.41262817383, ['zplayer'] = 38.057014465332, ['heading'] = 221.73 }
}
  