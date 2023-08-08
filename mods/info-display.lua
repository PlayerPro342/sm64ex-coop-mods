-- name: Info Display
-- description: Info Display\nBy \\#6666ff\\devmario\\#dcdcdc\\ and \\#ff6666\\Troopa\n\n\\#dcdcdc\\Adds a square on the left side of your screen containing text of most of Mario's stats.

local enabled = true

local actTable = {
    [ACT_AIR_HIT_WALL] = "AIR_HIT_WALL",
    [ACT_AIR_THROW] = "AIR_THROW",
    [ACT_AIR_THROW_LAND] = "AIR_THROW_LAND",
    [ACT_BACKFLIP] = "BACKFLIP",
    [ACT_BACKFLIP_LAND] = "BACKFLIP_LAND",
    [ACT_BACKFLIP_LAND_STOP] = "BACKFLIP_LAND_STOP",
    [ACT_BACKWARD_AIR_KB] = "BACKWARD_AIR_KNOCKBACK",
    [ACT_BACKWARD_GROUND_KB] = "BACKWARD_GROUND_KNOCKBACK",
    [ACT_BACKWARD_ROLLOUT] = "BACKWARD_ROLLOUT",
    [ACT_BACKWARD_WATER_KB] = "BACKWARD_WATER_KNOCKBACK",
    [ACT_BBH_ENTER_JUMP] = "BBH_ENTER_JUMP",
    [ACT_BBH_ENTER_SPIN] = "BBH_ENTER_SPIN",
    [ACT_BEGIN_SLIDING] = "BEGIN_SLIDING",
    [ACT_BRAKING] = "BRAKING",
    [ACT_TURNING_AROUND] = "TURNING_AROUND",
    [ACT_BRAKING_STOP] = "BRAKING_STOP",
    [ACT_BREASTSTROKE] = "BREAST_STROKE",
    [ACT_BUBBLED] = "BUBBLED",
    [ACT_BURNING_FALL] = "BURNING_FALL",
    [ACT_BURNING_GROUND] = "BURNING_GROUND",
    [ACT_BURNING_JUMP] = "BURNING_JUMP",
    [ACT_BUTT_SLIDE] = "BUTT_SLIDE",
    [ACT_BUTT_SLIDE_AIR] = "BUTT_SLIDE_AIR",
    [ACT_BUTT_SLIDE_STOP] = "BUTT_SLIDE_STOP",
    [ACT_BUTT_STUCK_IN_GROUND] = "BUTT_STUCK_IN_GROUND",
    [ACT_CAUGHT_IN_WHIRLPOOL] = "CAUGHT_IN_WHIRLPOOL",
    [ACT_CLIMBING_POLE] = "CLIMBING_POLE",
    [ACT_COUGHING] = "COUGHING",
    [ACT_CRAWLING] = "CRAWLING",
    [ACT_CRAZY_BOX_BOUNCE] = "CRAZY_BOX_BOUNCE",
    [ACT_CREDITS_CUTSCENE] = "CREDITS_CUTSCENE",
    [ACT_CROUCHING] = "CROUCHING",
    [ACT_CROUCH_SLIDE] = "CROUCH_SLIDE",
    [ACT_DEATH_EXIT] = "DEATH_EXIT",
    [ACT_DEATH_EXIT_LAND] = "DEATH_EXIT_LAND",
    [ACT_DEATH_ON_BACK] = "DEATH_ON_BACK",
    [ACT_DEBUG_FREE_MOVE] = "DEBUG_FREE_MOVE",
    [ACT_DECELERATING] = "DECELERATING",
    [ACT_DISAPPEARED] = "DISAPPEARED",
    [ACT_DIVE] = "DIVE",
    [ACT_DIVE_PICKING_UP] = "DIVE_PICKING_UP",
    [ACT_DIVE_SLIDE] = "DIVE_SLIDE",
    [ACT_DOUBLE_JUMP] = "DOUBLE_JUMP",
    [ACT_DOUBLE_JUMP_LAND] = "DOUBLE_JUMP_LAND",
    [ACT_DOUBLE_JUMP_LAND_STOP] = "DOUBLE_JUMP_LAND_STOP",
    [ACT_DROWNING] = "DROWNING",
    [ACT_EATEN_BY_BUBBA] = "EATEN_BY_BUBBA",
    [ACT_ELECTROCUTION] = "ELECTROCUTION",
    [ACT_EMERGE_FROM_PIPE] = "EMERGE_FROM_PIPE",
    [ACT_END_PEACH_CUTSCENE] = "END_PEACH_CUTSCENE",
    [ACT_END_WAVING_CUTSCENE] = "END_WAVING_CUTSCENE",
    [ACT_ENTERING_STAR_DOOR] = "ENTERING_STAR_DOOR",
    [ACT_EXIT_AIRBORNE] = "EXIT_AIRBORNE",
    [ACT_EXIT_LAND_SAVE_DIALOG] = "EXIT_LAND_SAVE_DIALOG",
    [ACT_FALLING_DEATH_EXIT] = "FALLING_DEATH_EXIT",
    [ACT_FALL_AFTER_STAR_GRAB] = "FALL_AFTER_STAR_GRAB",
    [ACT_FEET_STUCK_IN_GROUND] = "FEET_STUCK_IN_GROUND",
    [ACT_FINISH_TURNING_AROUND] = "FINISH_TURNING_AROUND",
    [ACT_FIRST_PERSON] = "FIRST_PERSON",
    [ACT_FLUTTER_KICK] = "FLUTTER_KICK",
    [ACT_FLYING] = "FLYING",
    [ACT_FLYING_TRIPLE_JUMP] = "FLYING_TRIPLE_JUMP",
    [ACT_FORWARD_AIR_KB] = "FORWARD_AIR_KNOCKBACK", 
    [ACT_FORWARD_GROUND_KB] = "FORWARD_GROUND_KNOCKBACK",
    [ACT_FORWARD_ROLLOUT] = "FORWARD_ROLLOUT",
    [ACT_FORWARD_WATER_KB] = "FORWARD_WATER_KNOCKBACK",
    [ACT_FREEFALL] = "FREEFALL",
    [ACT_FREEFALL_LAND] = "FREEFALL_LAND",
    [ACT_FREEFALL_LAND_STOP] = "FREEFALL_LAND_STOP",
    [ACT_GETTING_BLOWN] = "GETTING_BLOWN",
    [ACT_GRABBED] = "GRABBED",
    [ACT_GRAB_POLE_FAST] = "GRAB_POLE_FAST",
    [ACT_GRAB_POLE_SLOW] = "GRAB_POLE_SLOW",
    [ACT_GROUND_BONK] = "GROUND_BONK",
    [ACT_GROUND_POUND] = "GROUND_POUND",
    [ACT_GROUND_POUND_LAND] = "GROUND_POUND_LAND",
    [ACT_HANGING] = "HANGING",
    [ACT_HANG_MOVING] = "HAND_MOVING",
    [ACT_HARD_BACKWARD_AIR_KB] = "HARD_BACKWARD_AIR_KNOCKBACK",
    [ACT_HARD_BACKWARD_GROUND_KB] = "HARD_BACKWARD_GROUND_KNOCKBACK",
    [ACT_HARD_FORWARD_AIR_KB] = "HARD_FORWARD_AIR_KNOCKBACK",
    [ACT_HARD_FORWARD_GROUND_KB] = "HARD_FORWARD_GROUND_KNOCKBACK",
    [ACT_HEAD_STUCK_IN_GROUND] = "HEAD_STUCK_IN_GROUND",
    [ACT_HEAVY_THROW] = "HEAVY_THROW",
    [ACT_HOLDING_BOWSER] = "HOLDING_BOWSER",
    [ACT_HOLDING_POLE] = "HOLDING_POLE",
    [ACT_HOLD_BEGIN_SLIDING] = "HOLD_BEGIN_SLIDING",
    [ACT_HOLD_BREASTSTROKE] = "HOLD_BREAST_STROKE",
    [ACT_HOLD_BUTT_SLIDE] = "HOLD_BUTT_SLIDE",
    [ACT_HOLD_BUTT_SLIDE_AIR] = "HOLD_BUTT_SLIDE_AIR",
    [ACT_HOLD_BUTT_SLIDE_STOP] = "HOLD_BUTT_SLIDE_STOP",
    [ACT_HOLD_DECELERATING] = "HOLD_DECELERATING",
    [ACT_HOLD_FLUTTER_KICK] = "HOLD_FLUTTER_KICK",
    [ACT_HOLD_FREEFALL] = "HOLD_FREEFALL",
    [ACT_HOLD_FREEFALL_LAND] = "HOLD_FREEFALL_LAND",
    [ACT_HOLD_FREEFALL_LAND_STOP] = "HOLD_FREEFALL_LAND_STOP",
    [ACT_HOLD_HEAVY_IDLE] = "HOLD_HEAVY_IDLE",
    [ACT_HOLD_HEAVY_WALKING] = "HOLD_HEAVY_WALKING",
    [ACT_HOLD_IDLE] = "HOLD_IDLE",
    [ACT_HOLD_JUMP] = "HOLD_JUMP",
    [ACT_HOLD_JUMP_LAND] = "HOLD_JUMP_LAND",
    [ACT_HOLD_JUMP_LAND_STOP] = "HOLD_JUMP_LAND_STOP",
    [ACT_HOLD_METAL_WATER_FALLING] = "HOLD_METAL_WATER_FALLING",
    [ACT_HOLD_METAL_WATER_FALL_LAND] = "HOLD_METAL_WATER_FALL_LAND",
    [ACT_HOLD_METAL_WATER_JUMP] = "HOLD_METAL_WATER_JUMP",
    [ACT_HOLD_METAL_WATER_JUMP_LAND] = "HOLD_METAL_WATER_JUMP_LAND",
    [ACT_HOLD_METAL_WATER_STANDING] = "HOLD_METAL_WATER_STANDING",
    [ACT_HOLD_METAL_WATER_WALKING] = "HOLD_METAL_WATER_WALKING",
    [ACT_HOLD_PANTING_UNUSED] = "HOLD_PAINTING_UNUSED",
    [ACT_HOLD_QUICKSAND_JUMP_LAND] = "HOLD_QUICKSAND_JUMP_LAND",
    [ACT_HOLD_STOMACH_SLIDE] = "HOLD_STOMACH_SLIDE",
    [ACT_HOLD_SWIMMING_END] = "HOLD_SWIMMING_END",
    [ACT_HOLD_WALKING] = "HOLD_WALKING",
    [ACT_HOLD_WATER_ACTION_END] = "HOLD_WATER_ACTION_END",
    [ACT_HOLD_WATER_IDLE] = "HOLD_WATER_IDLE",
    [ACT_HOLD_WATER_JUMP] = "HOLD_WATER_JUMP",
    [ACT_IDLE] = "IDLE",
    [ACT_INTRO_CUTSCENE] = "INTRO_CUTSCENE",
    [ACT_IN_CANNON] = "IN_CANNON",
    [ACT_IN_QUICKSAND] = "IN_QUICKSAND",
    [ACT_JUMBO_STAR_CUTSCENE] = "JUMBO_STAR_CUTSCENE",
    [ACT_JUMP] = "JUMP",
    [ACT_JUMP_KICK] = "JUMP_KICK",
    [ACT_JUMP_LAND] = "JUMP_LAND",
    [ACT_JUMP_LAND_STOP] = "JUMP_LAND_STOP",
    [ACT_LAVA_BOOST] = "LAVA_BOOST",
    [ACT_LAVA_BOOST_LAND] = "LAVA_BOOST_LAND",
    [ACT_LEDGE_CLIMB_DOWN] = "LEDGE_CLIMB_DOWN",
    [ACT_LEDGE_CLIMB_FAST] = "LEDGE_CLIMB_FAST",
    [ACT_LEDGE_CLIMB_SLOW_1] = "LEDGE_CLIMB_SLOW_1",
    [ACT_LEDGE_CLIMB_SLOW_2] = "LEDGE_CLIMB_SLOW_2",
    [ACT_LEDGE_GRAB] = "LEDGE_GRAB",
    [ACT_LONG_JUMP] = "LONG_JUMP",
    [ACT_LONG_JUMP_LAND] = "LONG_JUMP_LAND",
    [ACT_LONG_JUMP_LAND_STOP] = "LONG_JUMP_LAND_STOP",
    [ACT_METAL_WATER_FALLING] = "METAL_WATER_FALLING",
    [ACT_METAL_WATER_FALL_LAND] = "METAL_WATER_FALL_LAND",
    [ACT_METAL_WATER_JUMP] = "METAL_WATER_JUMP",
    [ACT_METAL_WATER_JUMP_LAND] = "METAL_WATER_JUMP_LAND",
    [ACT_METAL_WATER_STANDING] = "METAL_WATER_STANDING",
    [ACT_METAL_WATER_WALKING] = "METAL_WATER_WALKING",
    [ACT_MOVE_PUNCHING] = "MOVE_PUNCHING",
    [ACT_PANTING] = "PANTING",
    [ACT_PICKING_UP] = "PICKING_UP",
    [ACT_PICKING_UP_BOWSER] = "PICKING_UP_BOWSER",
    [ACT_PLACING_DOWN] = "PLACING_DOWN",
    [ACT_PULLING_DOOR] = "PULLING_DOOR",
    [ACT_PUNCHING] = "PUNCHING",
    [ACT_PUSHING_DOOR] = "PUSHING_DOOR",
    [ACT_PUTTING_ON_CAP] = "PUTTING_ON_CAP",
    [ACT_QUICKSAND_DEATH] = "QUICKSAND_DEATH",
    [ACT_QUICKSAND_JUMP_LAND] = "QUICKSAND_JUMP_LAND",
    [ACT_READING_AUTOMATIC_DIALOG] = "READING_AUTOMATIC_DIALOG",
    [ACT_READING_NPC_DIALOG] = "READING_NPC_DIALOG",
    [ACT_READING_SIGN] = "READING_SIGN",
    [ACT_RELEASING_BOWSER] = "RELEASING_BOWSER",
    [ACT_RIDING_HOOT] = "RIDING_HOOT",
    [ACT_RIDING_SHELL_FALL] = "RIDING_SHELL_FALL",
    [ACT_RIDING_SHELL_GROUND] = "RIDING_SHELL_GROUND",
    [ACT_RIDING_SHELL_JUMP] = "RIDING_SHELL_JUMP",
    [ACT_SHIVERING] = "SHIVERING",
    [ACT_SHOCKED] = "SHOCKED",
    [ACT_SHOCKWAVE_BOUNCE] = "SHOCKWAVE_BOUNCE",
    [ACT_SHOT_FROM_CANNON] = "SHOT_FROM_CANNON",
    [ACT_SIDE_FLIP] = "SIDE_FLIP",
    [ACT_SIDE_FLIP_LAND] = "SIDE_FLIP_LAND",
    [ACT_SIDE_FLIP_LAND_STOP] = "SIDE_FLIP_LAND_STOP",
    [ACT_SLEEPING] = "SLEEPING",
    [ACT_SLIDE_KICK] = "SLIDE_KICK",
    [ACT_SLIDE_KICK_SLIDE] = "SLIDE_KICK_SLIDE",
    [ACT_SLIDE_KICK_SLIDE_STOP] = "SLIDE_KICK_SLIDE_STOP",
    [ACT_SOFT_BACKWARD_GROUND_KB] = "SOFT_BACKWARD_GROUND_KNOCKBACK",
    [ACT_SOFT_BONK] = "SOFT_BONK",
    [ACT_SOFT_FORWARD_GROUND_KB] = "SOFT_FORWARD_GROUND_KNOCKBACK",
    [ACT_SPAWN_NO_SPIN_AIRBORNE] = "SPAWN_NO_SPIN_AIRBORNE",
    [ACT_SPAWN_NO_SPIN_LANDING] = "SPAWN_NO_SPIN_LANDING",
    [ACT_SPAWN_SPIN_AIRBORNE] = "SPAWN_SPIN_AIRBORNE",
    [ACT_SPAWN_SPIN_LANDING] = "SPAWN_SPIN_LANDING",
    [ACT_SPECIAL_DEATH_EXIT] = "SPECIAL_DEATH_EXIT",
    [ACT_SPECIAL_EXIT_AIRBORNE] = "SPECIAL_EXIT_AIRBORNE",
    [ACT_SPECIAL_TRIPLE_JUMP] = "SPECIAL_TRIPLE_JUMP",
    [ACT_SQUISHED] = "SQUISHED",
    [ACT_STANDING_AGAINST_WALL] = "STANDING_AGAINST_WALL",
    [ACT_STANDING_DEATH] = "STANDING_DEATH",
    [ACT_START_CRAWLING] = "START_CRAWLING",
    [ACT_START_CROUCHING] = "START_CROUCHING",
    [ACT_START_HANGING] = "START_HANGING",
    [ACT_START_SLEEPING] = "START_SLEEPING",
    [ACT_STAR_DANCE_EXIT] = "STAR_DANCE_EXIT",
    [ACT_STAR_DANCE_NO_EXIT] = "STAR_DANCE_NO_EXIT",
    [ACT_STAR_DANCE_WATER] = "STAR_DANCE_WATER",
    [ACT_STEEP_JUMP] = "STEEP_JUMP",
    [ACT_STOMACH_SLIDE] = "STOMACH_SLIDE",
    [ACT_STOMACH_SLIDE_STOP] = "STOMACH_SLIDE_STOP",
    [ACT_STOP_CRAWLING] = "STOP_CRAWLING",
    [ACT_STOP_CROUCHING] = "STOP_CROUCHING",
    [ACT_SUFFOCATION] = "SUFFOCATION",
    [ACT_SWIMMING_END] = "SWIMMING_END",
    [ACT_TELEPORT_FADE_IN] = "TELEPORT_FADE_IN",
    [ACT_TELEPORT_FADE_OUT] = "TELEPORT_FADE_OUT",
    [ACT_THROWING] = "THROWING",
    [ACT_THROWN_BACKWARD] = "THROWN_BACKWARD",
    [ACT_THROWN_FORWARD] = "THROWN_FORWARD",
    [ACT_TOP_OF_POLE] = "TOP_OF_POLE",
    [ACT_TOP_OF_POLE_JUMP] = "TOP_OF_POLE_JUMP",
    [ACT_TOP_OF_POLE_TRANSITION] = "TOP_OF_POLE_TRANSITION",
    [ACT_TORNADO_TWIRLING] = "TORNADO_TWIRLING",
    [ACT_TRIPLE_JUMP] = "TRIPLE_JUMP",
    [ACT_TRIPLE_JUMP_LAND] = "TRIPLE_JUMP_LAND",
    [ACT_TRIPLE_JUMP_LAND_STOP] = "TRIPLE_JUMP_LAND_STOP",
    [ACT_UNINITIALIZED] = "UNINITIALIZED",
    [ACT_UNKNOWN_0002020E] = "UNKNOWN_0002020E",
    [ACT_UNLOCKING_KEY_DOOR] = "UNLOCKING_KEY_DOOR",
    [ACT_UNLOCKING_STAR_DOOR] = "UNLOCKING_STAR_DOOR",
    [ACT_UNUSED_DEATH_EXIT] = "UNUSED_DEATH_EXIT",
    [ACT_VERTICAL_WIND] = "VERTICAL_WIND",
    [ACT_WAITING_FOR_DIALOG] = "WAITING_FOR_DIALOG",
    [ACT_WAKING_UP] = "WAKING_UP",
    [ACT_WALKING] = "WALKING",
    [ACT_WALL_KICK_AIR] = "WALL_KICK_AIR",
    [ACT_WARP_DOOR_SPAWN] = "WARP_DOOR_SPAWN",
    [ACT_WATER_ACTION_END] = "WATER_ACTION_END",
    [ACT_WATER_DEATH] = "WATER_DEATH",
    [ACT_WATER_IDLE] = "WATER_IDLE",
    [ACT_WATER_JUMP] = "WATER_JUMP",
    [ACT_WATER_PLUNGE] = "WATER_PLUNGE",
    [ACT_WATER_PUNCH] = "WATER_PUNCH",
    [ACT_WATER_SHELL_SWIMMING] = "WATER_SHELL_SWIMMING",
    [ACT_WATER_SHOCKED] = "WATER_SHOCKED",
    [ACT_WATER_THROW] = "WATER_THROW",
}

local textTable = {
    [1] = "Action",
    [2] = "ActionArg",
    [3] = "ActionState",
    [4] = "ActionTimer",
    [5] = "AnimFrame",
    [6] = "Animation",
    [7] = "CeilHeight",
    [8] = "FaceAngle",
    [9] = "FloorType",
    [10] = "FloorHeight",
    [11] = "FowardVel",
    [12] = "Position",
    [13] = "SlideVelX",
    [14] = "SlideVelY",
    [15] = "Velocity",
    [16] = "Wall",
    [17] = "WaterLevel",
}

local function on_hud_render()
    if not enabled then return end

    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(FONT_NORMAL)

    local scale = 0.6

    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text("WaterLevel: -11000") * scale
    local height = 32 * scale
    
    local m = gMarioStates[0]

    local x = (screenWidth - width) * 0.1
    local y = (screenHeight - height) * 0.1

    djui_hud_set_color(0, 0, 0, 63)
    djui_hud_render_rect(x - 10 * scale, y - 3, width + 20 * scale, (height + 3 + (#textTable * 12)))

    djui_hud_set_color(0, 0, 0, 128)
    djui_hud_render_rect(x - 6 * scale, y, width + 12 * scale, (height + (#textTable * 12)))

    for i = 1, #textTable do
        local text = textTable[i]

        if i == 1 then
            text = text .. ": " .. actTable[m.action]
        elseif i == 2 then
            text = text .. ": " .. m.actionArg
        elseif i == 3 then
            text = text .. ": " .. m.actionState
        elseif i == 4 then
            text = text .. ": " .. m.actionTimer
        elseif i == 5 then
            text = text .. ": " .. m.marioObj.header.gfx.animInfo.animFrame
        elseif i == 6 then
            -- text = text .. ": " .. m.marioObj.header.gfx.animInfo
        elseif i == 7 then
            text = text .. ": " .. string.format("%.1f", m.ceilHeight)
        elseif i == 8 then
            text = text .. ": " .. m.faceAngle.y
        elseif i == 9 then
            text = text .. ": " .. m.marioObj.oFloorType
        elseif i == 10 then
            text = text .. ": " .. string.format("%.1f", m.floorHeight)
        elseif i == 11 then
            text = text .. ": " .. string.format("%.1f", m.forwardVel)
        elseif i == 12 then
            text = text .. ": " .. string.format("%.0f, %.0f, %.0f", m.pos.x, m.pos.y, m.pos.z)
        elseif i == 13 then
            text = text .. ": " .. string.format("%.1f", m.slideVelX)
        elseif i == 14 then
            text = text .. ": " .. string.format("%.1f", m.slideVelZ)
        elseif i == 15 then
            text = text .. ": " .. string.format("%.0f, %.0f, %.0f", m.vel.x, m.vel.y, m.vel.z)
        elseif i == 16 then
            if not m.wall then
                text = text .. ": none"
            else
                text = text .. ": " .. string.format("%.0f, %.0f, %.0f", m.wall.normal.x, m.wall.normal.y, m.wall.normal.z)
            end
        elseif i == 17 then
            text = text .. ": " .. string.format("%.0f", tostring(m.waterLevel))
        end
        
        djui_hud_set_color(255, 255, 255, 255)
        djui_hud_print_text(text, x, (y + ((i - 1) * 12)), scale - 0.25)
    end
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
hook_chat_command("info", " [on|off] Toggles Info Display on or off.", function(msg)
    if msg ~= nil then
        local low = string.lower(msg)

        if low == "on" or low == "1" then
            enabled = true
        elseif low == "off" or low == "0" then
            enabled = false
        else
            enabled = not enabled
        end
    else
        enabled = not enabled
    end

    if enabled then
        djui_chat_message_create("Info Display is on.")
    else
        djui_chat_message_create("Info Display is off.")
    end

    return true
end)