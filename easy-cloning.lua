-- name: Easy Cloning \\#FFFFEE\\V2 WIP
-- description: \\#FFFFEE\\Easy Cloning V2\nBy \\#6666FF\\Disguise\\#FFFFEE\\Kd\\#DCDCDC\\\n\n\\#FFFF00\\Double press L: Fake object\nPress Y: Toggle handsfree\n\nThere are 2 commands so far,\nprefix is 'ec:'

local trustedTable = {}

if mod_storage_load("showHolp") == nil then
	mod_storage_save("showHolp", "true")
end

local showHolp = mod_storage_load("showHolp")

gGlobalSyncTable.cloneRank = 0 -- 0: all, 1: trusted, 2: host (WIP)

-- HOLP Display --
local function on_hud_render()
    if showHolp ~= "true" then return false end
    
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(FONT_NORMAL)

    local x = djui_hud_get_screen_width() * 0.84
    local y = djui_hud_get_screen_height() * 0.5

    djui_hud_set_color(0, 0, 0, 127)
    djui_hud_render_rect(x - 10, y + 1, djui_hud_measure_text("x: 000") + 3, 46)
    djui_hud_set_color(255, 255, 255, 255)
    
    local m = gMarioStates[0]
    local holp = m.marioBodyState.heldObjLastPosition
    
    y = y - 1
    
    djui_hud_print_text("HOLP", x - 7, y, 0.5)
    djui_hud_print_text("x: " .. math.floor(holp.x), x - 7, y + 10, 0.5)
    djui_hud_print_text("y: " .. math.floor(holp.y), x - 7, y + 21, 0.5)
    djui_hud_print_text("z: " .. math.floor(holp.z), x - 7, y + 32, 0.5)
end


-- Table initialize
local function player_initialize(m)    
	syncTable = gPlayerSyncTable[m.playerIndex]
	syncTable.doubleClickTimer = 0
end

-- Cloning --
local function before_mario_update(m)
    if m.playerIndex ~= 0 then return end
    
    local syncTable = gPlayerSyncTable[m.playerIndex]
    local obj
    
    -- Double click timer down
    if syncTable.doubleClickTimer > 0 then
       syncTable.doubleClickTimer = syncTable.doubleClickTimer - 1
    end
    
    -- Spawn fake object
    if syncTable.doubleClickTimer > 0 and (m.controller.buttonPressed & L_TRIG) ~= 0 then
            if gGlobalSyncTable.cloneRank == 2 and not network_is_server() then djui_popup_create("Cloning is host only.", 1) return end
            if gGlobalSyncTable.cloneRank == 1 and not (trustedTable[gNetworkPlayers[0].name] or network_is_server()) then djui_popup_create("Cloning is trusted only.", 1) return end
            djui_popup_create("Spawned fake object.", 1)
            
            obj = spawn_sync_object(
            id_bhvBobomb,
            E_MODEL_BOBOMB_BUDDY,
            m.pos.x, m.pos.y, m.pos.z,
            function(obj)
                obj.oBehParams2ndByte = 0
                obj.oOpacity = 255
                obj.oFlags = OBJ_FLAG_HOLDABLE
                obj.oInteractType = obj.oInteractType | INTERACT_GRABBABLE
            end)

            if obj ~= nil then
                m.usedObj = obj
                mario_grab_used_object(m)
                m.marioBodyState.grabPos = GRAB_POS_LIGHT_OBJ
                set_mario_action(m, ACT_HOLD_IDLE, 0)
            end
            
        syncTable.doubleClickTimer = 0
        obj_mark_for_deletion(obj)
    end
    
    -- Double click timer up
    if syncTable.doubleClickTimer == 0 and (m.controller.buttonPressed & L_TRIG) ~= 0 then
        syncTable.doubleClickTimer = 15
    end
    
    -- Toggle handsfree
    if (m.controller.buttonPressed & Y_BUTTON ~= 0) then
        if m.marioBodyState.grabPos == GRAB_POS_LIGHT_OBJ then
            m.marioBodyState.grabPos = GRAB_POS_NULL
            set_mario_action(m, ACT_DOUBLE_JUMP, 0)
            mario_grab_used_object(m)
        else
            m.marioBodyState.grabPos = GRAB_POS_LIGHT_OBJ
            set_mario_action(m, ACT_HOLD_IDLE, 0)
            mario_grab_used_object(m)
        end
    end
end

-- HOLP Display command.
function holp_cmd(msg)
	if msg == string.lower("On") or msg == "1" then
		djui_chat_message_create("HOLP Display is ON.")
		mod_storage_save("showHolp", "true")
		showHolp = mod_storage_load("showHolp")
	elseif msg == string.lower("Off") or msg == "0" then
		djui_chat_message_create("HOLP Display is OFF.")
		mod_storage_save("showHolp", "false")
		showHolp = mod_storage_load("showHolp")
    else
        djui_chat_message_create("This command requires an argument. [On|Off]")
	end

    return true
end

--[[
function magic_grab_cmd(msg)
	if tonumber(msg) ~= nil then
        local find = find_object_with_behavior(id_bhvYellowCoin)
        
        if find then
            gNetworkPlayers[0].usedObj = find
            mario_grab_used_object(m)
            gNetworkPlayers[0].marioBodyState.grabPos = GRAB_POS_LIGHT_OBJ
            set_mario_action(m, ACT_HOLD_IDLE, 0)
        else
            djui_chat_message_create("Couldn't find object. Make sure you type it correctly, or if it exists in the level.")
        end

    else
        djui_chat_message_create("This command requires an argument. [Behavior ID]")
	end

    return true
end
]]--

-- Add people to the trusted table
function trust_add_cmd(msg)
    if msg then

    else
        djui_chat_message_create("This command requires an argument. [Player Index]")
    end
end

-- Host only command. ((Request by watchr and KoylaPro))
function rank_spawn_cmd(msg)
	if msg == string.lower("On") or msg == "1" then
		djui_chat_message_create("Host only cloning.")
        gGlobalSyncTable.cloneRank = 2
	elseif msg == string.lower("Off") or msg == "0" then
		djui_chat_message_create("Everyone can clone.")
        gGlobalSyncTable.cloneRank = 0
    else
        djui_chat_message_create("This command requires an argument. [0-2]")
	end

    return true
end

-- Hooks --
hook_event(HOOK_ON_PLAYER_CONNECTED, player_initialize)
hook_event(HOOK_BEFORE_MARIO_UPDATE, before_mario_update)
hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
hook_chat_command('ec:holp_display', ' [On|Off] > Displays the HOLP. Default is On.', holp_cmd)
--hook_chat_command('ec:magic_grab', ' [Bhv ID] > Finds for an object with that behavior and grabs it.', magic_grab_cmd)

if network_is_server() then
    hook_chat_command('ec:rank_spawn', ' [0-2] > Changes the rank needed to clone objects. Default is 0', rank_spawn_cmd)
end