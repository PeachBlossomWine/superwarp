local entry_zones = S{33}
local temenos_zone = 37
local npc_names = T{
    port = S{'Matter Diffusion Module'},
	back = S{'Matter Diffusion Module'},
    ['next'] = S{'Matter Diffusion Module'},
	['random'] = S{'Matter Diffusion Module'},
    warp = S{'Matter Diffusion Module'},
}

   local destination_array = {
	   E  = {display_name = 'Entrance' ,        zone = 37, menu_id = 1000, index = 510, npc = 16929278, offset = 1, x = 580, z = 0 ,  y = 86.000007629395,   h = 63,  unknown1 = 1 , unknown2 = 1},
	   N1 = {display_name = 'Northern Tower 1', zone = 37, menu_id = 1004, index = 571, npc = 16929339, offset = 1, x = -140,z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 11 ,unknown2 = 1},
	   N2 = {display_name = 'Northern Tower 2', zone = 37, menu_id = 1005, index = 572, npc = 16929340, offset = 2, x = -260,z = 77.620002746582 , y = 376.00003051758, h = 191, unknown1 = 12 ,unknown2 = 1},
	   N3 = {display_name = 'Northern Tower 3', zone = 37, menu_id = 1006, index = 573, npc = 16929341, offset = 3, x = -460.00003051758, z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 13 ,unknown2 = 1},
	   N4 = {display_name = 'Northern Tower 4', zone = 37, menu_id = 1007, index = 574, npc = 16929342, offset = 4, x = -580,z = 77.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 14 ,unknown2 = 1},
	   W1 = {display_name = 'Western Tower 1',  zone = 37, menu_id = 1011, index = 578, npc = 16929346, offset = 3, x = -140,z = -162.38000488281 ,y = 96.000007629395,                h = 191, unknown1 = 21, unknown2 = 1},
	   W2 = {display_name = 'Western Tower 2',  zone = 37, menu_id = 1012, index = 579, npc = 16929347, offset = 4, x = -260,z = -2.3800001144409 ,y = 96.000007629395,                h = 191, unknown1 = 22, unknown2 = 1},
	   W3 = {display_name = 'Western Tower 3',  zone = 37, menu_id = 1013, index = 580, npc = 16929348, offset = 0, x = -460.00003051758, z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 23, unknown2 = 1},
	   W4 = {display_name = 'Western Tower 4',  zone = 37, menu_id = 1014, index = 581, npc = 16929349, offset = 5, x = -580,z = -2.3800001144409, y = 96.000007629395,                h = 191, unknown1 = 24, unknown2 = 1},
	   E1 = {display_name = 'Eastern Tower 1',  zone = 37, menu_id = 1018, index = 585, npc = 16929353, offset = 9,  x = -140,z = -82.380004882812, y = -184.00001525879,               h = 191, unknown1 = 31, unknown2 = 1},
	   E2 = {display_name = 'Eastern Tower 2',  zone = 37, menu_id = 1019, index = 586, npc = 16929354, offset = 10, x = -260,z = 77.620002746582,  y = -184.00001525879,               h = 191, unknown1 = 32, unknown2 = 1},
	   E3 = {display_name = 'Eastern Tower 3',  zone = 37, menu_id = 1020, index = 587, npc = 16929355, offset = 10, x = -460.00003051758, z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 33, unknown2 = 1},
	   E4 = {display_name = 'Eastern Tower 4',  zone = 37, menu_id = 1021, index = 588, npc = 16929356, offset = 1,  x = -580,z = 77.620002746582,   y = -184.00001525879,              h = 191, unknown1 = 34, unknown2 = 1},
	   C1 = {display_name = 'Central Tower 1',  zone = 37, menu_id = 1023, index = 590, npc = 16929358, offset = 5, x = 260, z = -162.38000488281, y = -504.00003051758,  h = 191, unknown1 = 41, unknown2 = 1},
	   C2 = {display_name = 'Central Tower 2',  zone = 37, menu_id = 1024, index = 591, npc = 16929359, offset = 6, x = 20,  z = -2.3800001144409, y = -544,              h = 191, unknown1 = 42, unknown2 = 1},
	   C3 = {display_name = 'Central Tower 3',  zone = 37, menu_id = 1025, index = 592, npc = 16929360, offset = 7, x = -296,z = -162.38000488281, y = -500.00003051758,  h = 127, unknown1 = 43, unknown2 = 1},
	   CN = {display_name = 'Temenos Central B1',zone = 37, menu_id = 1026, index = 594, npc = 16929361, offset = 8, x = -540,z = -2.3800001144409, y = -584,  h = 191, unknown1 = 51, unknown2 = 1},   

	}
local temp_item_ids = {
   -- North
        ["N1"] = 9956,
        ["N2"] = 9957,
        ["N3"] = 9958,
        ["N4"] = 9959,
   -- West
        ["W1"] = 9963,
        ["W2"] = 9964,
        ["W3"] = 9965,
        ["W4"] = 9966,
   --East
        ["E1"] = 9970,
        ["E2"] = 9971,
        ["E3"] = 9972,
        ["E4"] = 9973,
   -- Central
        ["C1"] = 9977,
        ["C2"] = 9978,
        ["C3"] = 9979,
}

local function has_temp_item(item_id)
    local temp_items = windower.ffxi.get_items(3)
    for _, item in ipairs(temp_items) do
        if item.id == item_id then
            return true
        end
    end
    return false
end

local floor_order = {
    "N1","N2","N3","N4",
    "W1","W2","W3","W4",
    "E1","E2","E3","E4",
    "C1","C2","C3",
}

local function find_first_missing_floor()
    for _, _floor in ipairs(floor_order) do
        local item_id = temp_item_ids[_floor]
        if not has_temp_item(item_id) then
            return _floor, item_id
        end
    end
    return nil
end

local function get_current_floor(menu_id)
    for floor, data in pairs(destination_array) do
        if data.menu_id == menu_id then
            return floor
        end
    end
    return nil
end	
	
local function find_shuffled_missing_floor(menu_id)
    local current_floor = get_current_floor(menu_id)
    if not current_floor then return nil end

    local current_tower = current_floor:sub(1, 1)
    local fallback_floor, fallback_item = nil, nil
    for floor, item_id in pairs(temp_item_ids) do
        if floor ~= current_floor and not has_temp_item(item_id) then
            if floor:sub(1, 1) == current_tower then
                return floor, item_id
            end
            if not fallback_floor then
                fallback_floor, fallback_item = floor, item_id
            end
        end
    end
    return fallback_floor, fallback_item
end

return T {
    short_name = 'te',
    long_name = 'temenos',
    move_in_zone = true,
    npc_plural = 'Modules',
    npc_names = npc_names,
    zone_npc_list = function(type)
        local mlist = windower.ffxi.get_mob_list()
        mlist = table.filter(mlist, function(name)
            return name ~= "" and npc_names[type]:any(string.startswith + {name})
        end)
        mlist = table.map(mlist, function(name)
            local num = name:match('%d+$')
            return {
                name = name,
                key = (num and tostring(num))
            }
        end)
        return mlist
    end,
    validate = function(menu_id, zone, current_activity,p)
		local _floor, item_id = find_first_missing_floor()
		local _shuffle, item_id = find_shuffled_missing_floor(menu_id)
		local destination = nil
		local cross_tower_checkinator = nil
		local current_floor_checkinator = nil
        if current_activity.sub_cmd == 'port' or current_activity.sub_cmd == 'next' or current_activity.sub_cmd == 'back' or current_activity.sub_cmd == 'random' then
            destination = nil
        else
            destination = current_activity.activity_settings
        end
		-------------------------------------------------------------------------------------------------------------------------------------------
       -- Destination setters
        --------------------------------------------------------------------------------------------------------------------------------------------
		if current_activity.sub_cmd == 'next' then
			if _floor then
				destination = destination_array[_floor]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 1000 then
				destination = destination_array.C3
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 1025 or menu_id == 1007 or menu_id == 1014 or menu_id == 1021 then
				return 'All data collected. Open the chest on this floor before proceeding. If your units are overflowing and you do not wish to open the chest, use the port command. //te port'
			else
				if menu_id >= 1001 and menu_id <= 1006 then
					destination = destination_array.N4
				elseif menu_id >= 1008 and menu_id <= 1013 then
					destination = destination_array.W4
				elseif menu_id >= 1015 and menu_id <= 1020 then
					destination = destination_array.E4
				elseif menu_id >= 1022 and menu_id <= 1024 then
					destination = destination_array.C3
				end
				log('All data collected. Sending you to open the chest.')
			end 
		elseif current_activity.sub_cmd == 'random' then
			if _shuffle then
				destination = destination_array[_shuffle]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 1000 then
				destination = destination_array.C3
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 1025 or menu_id == 1007 or menu_id == 1014 or menu_id == 1021 then
				return 'All data collected. Open the chest on this floor before proceeding. If your units are overflowing and you do not wish to open the chest, use the port command. //te port'
			else
				if menu_id >= 1001 and menu_id <= 1006 then
					destination = destination_array.N4
				elseif menu_id >= 1008 and menu_id <= 1013 then
					destination = destination_array.W4
				elseif menu_id >= 1015 and menu_id <= 1020 then
					destination = destination_array.E4
				elseif menu_id >= 1022 and menu_id <= 1024 then
					destination = destination_array.C3
				end
				log('All data collected. Sending you to open the chest.')
			end 
		--------------------------------------------
		elseif current_activity.sub_cmd == 'port' then
			if menu_id == 1000 then
				destination = destination_array.N1
			elseif menu_id == 1004 then
				destination = destination_array.N2
			elseif menu_id == 1005 then
				destination = destination_array.N3
			elseif menu_id == 1006 then
				destination = destination_array.N4
			elseif menu_id == 1007 then
				destination = destination_array.E
			elseif menu_id == 1011 then
				destination = destination_array.W2
			elseif menu_id == 1012 then
				destination = destination_array.W3
			elseif menu_id == 1013 then
				destination = destination_array.W4
			elseif menu_id == 1014 then
				destination = destination_array.E
			elseif menu_id == 1018 then
				destination = destination_array.E2
			elseif menu_id == 1019 then
				destination = destination_array.E3
			elseif menu_id == 1020 then
				destination = destination_array.E4
			elseif menu_id == 1021 then
				destination = destination_array.E
			elseif menu_id == 1023 then
				destination = destination_array.C2
			elseif menu_id == 1024 then
				destination = destination_array.C3
			elseif menu_id == 1025 then
				destination = destination_array.E
			end
		elseif current_activity.sub_cmd == 'back' then
			if menu_id == 1025 then
				destination = destination_array.C3
			elseif menu_id == 1024 then
				destination = destination_array.C2
			elseif menu_id == 1023 then
				destination = destination_array.C1
			elseif menu_id == 1022 then
				destination = destination_array.E
			elseif menu_id == 1021 then
				destination = destination_array.E3
			elseif menu_id == 1020 then
				destination = destination_array.E2
			elseif menu_id == 1019 then
				destination = destination_array.E1
			elseif menu_id == 1018 then
				destination = destination_array.E
			elseif menu_id == 1014 then
				destination = destination_array.W3
			elseif menu_id == 1013 then
				destination = destination_array.W2
			elseif menu_id == 1012 then
				destination = destination_array.W1
			elseif menu_id == 1011 then
				destination = destination_array.E
			elseif menu_id == 1007 then
				destination = destination_array.N3
			elseif menu_id == 1006 then
				destination = destination_array.N2
			elseif menu_id == 1005 then	
				destination = destination_array.N1
			elseif menu_id == 1004 then	
				destination = destination_array.E
			elseif menu_id == 1000 then
				destination = destination_array.C3
			end
		end
-------------------------------------------
        if not
        (menu_id >= 1000 and menu_id <= 1025) then
            return "Incorrect menu detected! Menu ID: " .. menu_id
        end
        -- prevent warping between towers / next command cross-tower destination entrance override
        ----------------North Tower--------------------------------------------------------------------------
        if (menu_id >= 1001 and menu_id <= 1007) and destination.menu_id ~= 1000 and (destination.menu_id > 1007 or destination.menu_id < 1001) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------West Tower--------------------------------------------------------------------------
        if (menu_id >= 1008 and menu_id <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------East Tower--------------------------------------------------------------------------
        if (menu_id >= 1015 and menu_id <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Central Tower--------------------------------------------------------------------------
        if (menu_id >= 1022 and menu_id <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
		------------Same floor prevention / data check warp override------------------
        if menu_id == destination.menu_id then
			if current_floor_checkinator and current_activity.sub_cmd == 'next' then
				current_floor_checkinator = nil
				return "You still have work to do on this floor."
			else
				return "You're already at that location"
			end
        end
---------------------------------
        if temenos_zone ~= zone then
            return 'Not in Temenos!'
        end
		current_floor_checkinator = nil
		cross_tower_checkinator = nil
        return nil
    end,
    help_text = "| Temenos |\n[sw] te [warp/w] [all/a/@all/party/p] e/n1/w2/e5/c3 etc. -- warp to a designated floor in Temenos. \n[sw] te [all/a/@all/party/p] port -- warp to the next floor of any tower, if on last floor will warp to the entrance, if at entrance will warp to n1. \n[sw] te [all/a/@all/party/p] next -- warp to the first uncompleted floor in sequence, if this is in another tower, will warp to the entrance.\n  [sw] te [all/a/@all/party/p] back -- the reverse of port command, teleports to the previous floor. If you are on the first floor of a tower this will send you to the entrance. \n [sw] te [all/a/@all/party/p] random -- Similar to the next command, sends you to floors you do not have the data for until you have collected all data; Will send you to other floors within the same tower until all are completed then will send to another tower/floor.\n-----------------------------",
    sub_zone_targets = S {'entrance','n1', 'n2', 'n3', 'n4', 'w1', 'w2','w3', 'w4', 'e1', 'e2', 'e3', 'e4','c1','c2','c3'}, 
    auto_select_zone = function(zone)
        if zone == 37 then
            return 'Temenos'
        end
    end,
    build_warp_packets = function(current_activity, zone, p, settings)
        local actions = T {}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
        local destination = current_activity.activity_settings		
        -- update request
        packet = packets.new('outgoing', 0x016)
        packet["Target Index"] = windower.ffxi.get_player().index
        actions:append(T {
            packet = packet,
            description = 'update request'
        })

        -- request map
        packet = packets.new('outgoing', 0x114)
        actions:append(T {
            packet = packet,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'request map'
        })

        -- menu change
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = 100 
        packet["_unknown1"] = 0
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            delay = 0.2,
            description = 'send options'
        })

        -- request in-zone warp
        packet = packets.new('outgoing', 0x05C)
        packet["Target ID"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["X"] = destination.x
        packet["Y"] = destination.y
        packet["Z"] = destination.z
        packet["_unknown1"] = destination.unknown1 
        packet["Rotation"] = destination.h
        packet["_unknown2"] = destination.unknown2
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'same-zone move request'
        })

        -- complete menu
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = destination.unknown1 
        packet["_unknown1"] = 0
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
        })

        return actions
    end,
    sub_commands = {
        port = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local destination = nil

		if current_activity.sub_cmd == 'port' then
			if menu == 1000 then
				destination = destination_array.N1
			elseif menu == 1004 then
				destination = destination_array.N2
			elseif menu == 1005 then
				destination = destination_array.N3
			elseif menu == 1006 then
				destination = destination_array.N4
			elseif menu == 1007 then
				destination = destination_array.E
			elseif menu == 1011 then
				destination = destination_array.W2
			elseif menu == 1012 then
				destination = destination_array.W3
			elseif menu == 1013 then
				destination = destination_array.W4
			elseif menu == 1014 then
				destination = destination_array.E
			elseif menu == 1018 then
				destination = destination_array.E2
			elseif menu == 1019 then
				destination = destination_array.E3
			elseif menu == 1020 then
				destination = destination_array.E4
			elseif menu == 1021 then
				destination = destination_array.E
			elseif menu == 1023 then
				destination = destination_array.C2
			elseif menu == 1024 then
				destination = destination_array.C3
			elseif menu == 1025 then
				destination = destination_array.E
			end
		end

		    --------------------------------------------------------------------------------------
		    log('Warping via ' .. npc.name .. ' to '..destination.display_name..'.')
			--------------------------------------------------------------------------------------
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
                description = 'update request'
            })

            -- request map
            packet = packets.new('outgoing', 0x114)
            actions:append(T {
                packet = packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'request map'
            })

            -- menu change
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = 100
            packet["_unknown1"] = 0
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            actions:append(T {
                packet = packet,
                delay = 0.2,
                description = 'send options'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["Target ID"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["X"] = destination.x
            packet["Y"] = destination.y
            packet["Z"] = destination.z
            packet["_unknown1"] = destination.unknown1
            packet["Rotation"] = destination.h
            packet["_unknown2"] = destination.unknown2
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) ,
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Automated Message"] = false
            packet["_unknown2"] = 0

            actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
            })
            return actions
        end,
  
        back = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local destination = nil

		if current_activity.sub_cmd == 'back' then
			if menu == 1025 then
				destination = destination_array.C3
			elseif menu == 1024 then
				destination = destination_array.C2
			elseif menu == 1023 then
				destination = destination_array.C1
			elseif menu == 1022 then
				destination = destination_array.E
			elseif menu == 1021 then
				destination = destination_array.E3
			elseif menu == 1020 then
				destination = destination_array.E2
			elseif menu == 1019 then
				destination = destination_array.E1
			elseif menu == 1018 then
				destination = destination_array.E
			elseif menu == 1014 then
				destination = destination_array.W3
			elseif menu == 1013 then
				destination = destination_array.W2
			elseif menu == 1012 then
				destination = destination_array.W1
			elseif menu == 1011 then
				destination = destination_array.E
			elseif menu == 1007 then
				destination = destination_array.N3
			elseif menu == 1006 then
				destination = destination_array.N2
			elseif menu == 1005 then	
				destination = destination_array.N1
			elseif menu == 1004 then	
				destination = destination_array.E
			elseif menu == 1000 then
				destination = destination_array.C3
			end
		end

		    --------------------------------------------------------------------------------------
		    log('Warping via ' .. npc.name .. ' to '..destination.display_name..'.')
			--------------------------------------------------------------------------------------
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
                description = 'update request'
            })

            -- request map
            packet = packets.new('outgoing', 0x114)
            actions:append(T {
                packet = packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'request map'
            })

            -- menu change
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = 100
            packet["_unknown1"] = 0
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            actions:append(T {
                packet = packet,
                delay = 0.2,
                description = 'send options'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["Target ID"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["X"] = destination.x
            packet["Y"] = destination.y
            packet["Z"] = destination.z
            packet["_unknown1"] = destination.unknown1
            packet["Rotation"] = destination.h
            packet["_unknown2"] = destination.unknown2
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) ,
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Automated Message"] = false
            packet["_unknown2"] = 0

            actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
            })
            return actions
        end,

        ['next'] = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local _floor, item_id = find_first_missing_floor()
			local destination = nil


			if _floor then
				destination = destination_array[_floor]
			elseif menu == 1000 then
				destination = destination_array.C3
			elseif menu >= 1001 and menu <= 1006 then
				destination = destination_array.N4
			elseif menu >= 1008 and menu <= 1013 then
				destination = destination_array.W4
			elseif menu >= 1015 and menu <= 1020 then
				destination = destination_array.E4
			elseif menu >= 1022 and menu <= 1024 then
				destination = destination_array.C3
			end 

        if (menu >= 1001 and menu <= 1007) and destination.menu_id ~= 1000 and (destination.menu_id > 1007 or destination.menu_id < 1001) then
				destination = destination_array.E
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 1008 and menu <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
				destination = destination_array.E
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 1015 and menu <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
				destination = destination_array.E
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 1022 and menu <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
				destination = destination_array.E
        end
		    --------------------------------------------------------------------------------------
		    log('Warping via ' .. npc.name .. ' to '..destination.display_name..'.')
			--------------------------------------------------------------------------------------
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
                description = 'update request'
            })

            -- request map
            packet = packets.new('outgoing', 0x114)
            actions:append(T {
                packet = packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'request map'
            })

            -- menu change
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = 100
            packet["_unknown1"] = 0
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            actions:append(T {
                packet = packet,
                delay = 0.2,
                description = 'send options'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["Target ID"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["X"] = destination.x
            packet["Y"] = destination.y
            packet["Z"] = destination.z
            packet["_unknown1"] = destination.unknown1
            packet["Rotation"] = destination.h
            packet["_unknown2"] = destination.unknown2
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) ,
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Automated Message"] = false
            packet["_unknown2"] = 0

            actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
            })
            return actions
        end,
		
	['random'] = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local _floor, item_id = find_first_missing_floor()
			local destination = nil
			local _shuffle, item_id = find_shuffled_missing_floor(menu)
			if _shuffle then
				destination = destination_array[_shuffle]
			elseif menu == 1000 then
				destination = destination_array.C3
			elseif menu >= 1001 and menu <= 1006 then
				destination = destination_array.N4
			elseif menu >= 1008 and menu <= 1013 then
				destination = destination_array.W4
			elseif menu >= 1015 and menu <= 1020 then
				destination = destination_array.E4
			elseif menu >= 1022 and menu <= 1024 then
				destination = destination_array.C3
			end 

        if (menu >= 1001 and menu <= 1007) and destination.menu_id ~= 1000 and (destination.menu_id > 1007 or destination.menu_id < 1001) then
				destination = destination_array.E
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 1008 and menu <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
				destination = destination_array.E
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 1015 and menu <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
				destination = destination_array.E
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 1022 and menu <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
				destination = destination_array.E
        end
		if menu == destination.menu_id then
				destination = destination_array.E
			log('Cannot warp to same floor. Suspicious packets averted.')
		end
		    --------------------------------------------------------------------------------------
		    log('Warping via ' .. npc.name .. ' to '..destination.display_name..'.')
			--------------------------------------------------------------------------------------
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
                description = 'update request'
            })

            -- request map
            packet = packets.new('outgoing', 0x114)
            actions:append(T {
                packet = packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'request map'
            })

            -- menu change
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = 100
            packet["_unknown1"] = 0
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            actions:append(T {
                packet = packet,
                delay = 0.2,
                description = 'send options'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["Target ID"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["X"] = destination.x
            packet["Y"] = destination.y
            packet["Z"] = destination.z
            packet["_unknown1"] = destination.unknown1
            packet["Rotation"] = destination.h
            packet["_unknown2"] = destination.unknown2
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) ,
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Automated Message"] = false
            packet["_unknown2"] = 0

            actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
            })
            return actions
        end,		
    },
    warpdata = T{
        ['Temenos'] = T{  
			   ['Entrance']  = {display_name = 'Entrance' ,  menu_id = 1000, index = 510, npc = 16929278, offset = 1, x = 580, z = 0 ,  y = 86.000007629395,   h = 63,  unknown1 = 1 , unknown2 = 1},
			   ['N1'] = {display_name = 'Northern Tower 1',  menu_id = 1004, index = 571, npc = 16929339, offset = 1, x = -140,z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 11 ,unknown2 = 1},
			   ['N2'] = {display_name = 'Northern Tower 2',  menu_id = 1005, index = 572, npc = 16929340, offset = 2, x = -260,z = 77.620002746582 , y = 376.00003051758, h = 191, unknown1 = 12 ,unknown2 = 1},
			   ['N3'] = {display_name = 'Northern Tower 3',  menu_id = 1006, index = 573, npc = 16929341, offset = 3, x = -460.00003051758, z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 13 ,unknown2 = 1},
			   ['N4'] = {display_name = 'Northern Tower 4',  menu_id = 1007, index = 574, npc = 16929342, offset = 4, x = -580,z = 77.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 14 ,unknown2 = 1},
			   ['W1'] = {display_name = 'Western Tower 1',   menu_id = 1011, index = 578, npc = 16929346, offset = 3, x = -140,z = -162.38000488281 ,y = 96.000007629395,                h = 191, unknown1 = 21, unknown2 = 1},
			   ['W2'] = {display_name = 'Western Tower 2',   menu_id = 1012, index = 579, npc = 16929347, offset = 4, x = -260,z = -2.3800001144409 ,y = 96.000007629395,                h = 191, unknown1 = 22, unknown2 = 1},
			   ['W3'] = {display_name = 'Western Tower 3',   menu_id = 1013, index = 580, npc = 16929348, offset = 0, x = -460.00003051758, z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 23, unknown2 = 1},
			   ['W4'] = {display_name = 'Western Tower 4',   menu_id = 1014, index = 581, npc = 16929349, offset = 5, x = -580,z = -2.3800001144409, y = 96.000007629395,                h = 191, unknown1 = 24, unknown2 = 1},
			   ['E1'] = {display_name = 'Eastern Tower 1',   menu_id = 1018, index = 585, npc = 16929353, offset = 9,  x = -140,z = -82.380004882812, y = -184.00001525879,               h = 191, unknown1 = 31, unknown2 = 1},
			   ['E2'] = {display_name = 'Eastern Tower 2',   menu_id = 1019, index = 586, npc = 16929354, offset = 10, x = -260,z = 77.620002746582,  y = -184.00001525879,               h = 191, unknown1 = 32, unknown2 = 1},
			   ['E3'] = {display_name = 'Eastern Tower 3',   menu_id = 1020, index = 587, npc = 16929355, offset = 10, x = -460.00003051758, z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 33, unknown2 = 1},
			   ['E4'] = {display_name = 'Eastern Tower 4',   menu_id = 1021, index = 588, npc = 16929356, offset = 1,  x = -580,z = 77.620002746582,   y = -184.00001525879,              h = 191, unknown1 = 34, unknown2 = 1},
			   ['C1'] = {display_name = 'Central Tower 1',   menu_id = 1023, index = 590, npc = 16929358, offset = 5, x = 260, z = -162.38000488281, y = -504.00003051758,  h = 191, unknown1 = 41, unknown2 = 1},
			   ['C2'] = {display_name = 'Central Tower 2',   menu_id = 1024, index = 591, npc = 16929359, offset = 6, x = 20,  z = -2.3800001144409, y = -544,              h = 191, unknown1 = 42, unknown2 = 1},
			   ['C3'] = {display_name = 'Central Tower 3',   menu_id = 1025, index = 592, npc = 16929360, offset = 7, x = -296,z = -162.38000488281, y = -500.00003051758,  h = 127, unknown1 = 43, unknown2 = 1},
			   ['CN'] = {display_name = 'Temenos Central B1', menu_id = 1026, index = 594, npc = 16929361, offset = 8, x = -540,z = -2.3800001144409, y = -584,  h = 191, unknown1 = 51, unknown2 = 1},   
		},
    },
}