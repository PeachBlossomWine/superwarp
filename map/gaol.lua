local npc_names = T{
		enter = T{'Veridical Conflux'},
    }
	
return T{
    short_name = 'gaol',
    long_name = 'odyssey gaol',
    npc_plural = 'odyssey gaol npcs',
     npc_names = npc_names,
    zone_npc_list = function(type)
        local mlist = windower.ffxi.get_mob_list()
        mlist = table.filter(mlist, function(name)
            return name ~= "" and npc_names[type]:any(string.startswith+{name})
        end)
        mlist = table.map(mlist, function(name)
            return {name=name}
        end)
        return mlist
    end,
    validate = function(menu_id, zone, current_activity)
        if not(menu_id >= 1001 and menu_id <= 1001) then
            return "Incorrect menu detected! Menu ID: "..menu_id
        end
        return nil
    end,
    help_text = "[sw]",
	sub_zone_targets =  S{'1','2','3'},
	auto_select_zone = function(zone)
        if zone == 279 then return 'Walk of Echoes [P2]' end
        if zone == 298 then return 'Walk of Echoes [P1]' end
    end,
	sub_commands = {
        enter = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local destination = current_activity.activity_settings
            local args = current_activity.args

			odydata = T{
			-- Tier 1
				['A0'] = { name = 'Dealan-dhe', 	zone = 279, index = 0, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131072},
				['A1'] = { name = 'Sgili', 			zone = 279, index = 1, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131073},
				['A2'] = { name = 'U Bnai', 		zone = 279, index = 2, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131074},
				['A3'] = { name = 'Gogmagog', 		zone = 279, index = 3, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131075},
			-- Tier 2				
				['A4'] = { name = 'Aristaeus', 		zone = 279, index = 4, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131076},
				['A5'] = { name = 'Raskovniche', 	zone = 279, index = 5, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131077},
				['A6'] = { name = 'Marmorkrebs', 	zone = 279, index = 6, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131078},
				['A7'] = { name = 'Gigelorum', 		zone = 279, index = 7, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131079},
				['A8'] = { name = 'Procne', 		zone = 279, index = 8, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131080},
				['A9'] = { name = 'Henwen', 		zone = 279, index = 9, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131081},
			-- Tier 3				
				['A10'] = { name = 'Xevioso', 		zone = 279, index = 10, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131082},
				['A11'] = { name = 'Ngai', 			zone = 279, index = 11, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131083},
				['A12'] = { name = 'Kalunga', 		zone = 279, index = 12, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131084},
				['A13'] = { name = 'Ongo', 			zone = 279, index = 13, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131085},
				['A14'] = { name = 'Mboze', 		zone = 279, index = 14, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131086},
				['A15'] = { name = 'Arebati', 		zone = 279, index = 15, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131087},
			-- Tier 4
				['A16'] = { name = 'Bumba', 		zone = 279, index = 16, x = -700.00006103516, z = -17.5, y = -174.00001525879, h = 191, baselevel = 131088},
			}
			
			vengdata = T{
				['0'] = { name = 'V0 Difficulty', 	index = 0},
				['1'] = { name = 'V01 Difficulty', 	index = 256},
				['2'] = { name = 'V02 Difficulty', 	index = 512},
				['3'] = { name = 'V03 Difficulty', 	index = 768},
				['4'] = { name = 'V04 Difficulty', 	index = 1024},
				['5'] = { name = 'V05 Difficulty', 	index = 1280},
				['6'] = { name = 'V06 Difficulty', 	index = 1536},
				['7'] = { name = 'V07 Difficulty', 	index = 1792},
				['8'] = { name = 'V08 Difficulty', 	index = 2048},
				['9'] = { name = 'V09 Difficulty', 	index = 2304},
				['10'] = { name = 'V10 Difficulty', index = 2560},
				['11'] = { name = 'V11 Difficulty', index = 2816},
				['12'] = { name = 'V12 Difficulty', index = 3072},
				['13'] = { name = 'V13 Difficulty', index = 3328},
				['14'] = { name = 'V14 Difficulty', index = 3584},
				['15'] = { name = 'V15 Difficulty', index = 3840},
				['16'] = { name = 'V16 Difficulty', index = 4096},
				['17'] = { name = 'V17 Difficulty', index = 4352},
				['18'] = { name = 'V18 Difficulty', index = 4608},
				['19'] = { name = 'V19 Difficulty', index = 4864},
				['20'] = { name = 'V20 Difficulty', index = 5120},
				['21'] = { name = 'V21 Difficulty', index = 5376},
				['22'] = { name = 'V22 Difficulty', index = 5632},
				['23'] = { name = 'V23 Difficulty', index = 5888},
				['24'] = { name = 'V24 Difficulty', index = 6144},
				['25'] = { name = 'V25 Difficulty', index = 6400},
			}
			
			if #args >= 1 then
				
				local nm_choice = args[1]
				local nm_difficulty = 0
				local nm_difficulty_index = 0	
				local nm_difficulty_level = 0
				local data

				data = odydata[nm_choice]
				
				if #args == 1 then
					nm_difficulty = 0
				elseif #args == 2 then
					nm_difficulty = vengdata[args[2]].index
				end
	
				nm_difficulty_index = data.index + nm_difficulty
				nm_difficulty_level = data.baselevel + nm_difficulty
				
				--update request
				packet = packets.new('outgoing', 0x016)
				packet["Target Index"] = windower.ffxi.get_player().index
				actions:append(T{packet=packet, delay=0, description='update request'})
				
				-- start menu
				packet = packets.new('outgoing', 0x05B)
				packet["Target"] = npc.id
				packet["Target Index"] = npc.index
				packet["Zone"] = zone
				packet["Menu ID"] = menu
				packet["Option Index"] = 0
				packet["_unknown1"] = 0
				packet["Automated Message"] = true
				packet["_unknown2"] = 0
				actions:append(T{packet=packet, description='start menu'})

				-- mid menu
				packet = packets.new('outgoing', 0x05B)
				packet["Target"] = npc.id
				packet["Target Index"] = npc.index
				packet["Zone"] = zone
				packet["Menu ID"] = menu
				packet["Option Index"] = data.index
				packet["_unknown1"] = 1
				packet["Automated Message"] = true
				packet["_unknown2"] = 0
				actions:append(T{packet=packet, description='mid menu'})
			
				-- request in-zone warp
				packet = packets.new('outgoing', 0x05C)
				packet["Target ID"] = npc.id
				packet["Target Index"] = npc.index
				packet["Zone"] = zone
				packet["Menu ID"] = menu
				packet["X"] = data.x
				packet["Y"] = data.y
				packet["Z"] = data.z
				packet["_unknown1"] = nm_difficulty_level
				packet["_unknown2"] = 1
				packet["Rotation"] = data.h
				actions:append(T{packet=packet, delay=0, description='same-zone move request'})

				-- complete with difficluty choice menu
				packet = packets.new('outgoing', 0x05B)
				packet["Target"] = npc.id
				packet["Target Index"] = npc.index
				packet["Zone"] = zone
				packet["Menu ID"] = menu
				packet["Option Index"] = nm_difficulty_index
				packet["_unknown1"] = 2
				packet["Automated Message"] = false
				packet["_unknown2"] = 0
				actions:append(T{packet=packet, wait_packet=0x052, expecting_zone=false, delay=1, description='complete menu'})

			   return actions
			end
		end,
	},
	warpdata = T{
		['Walk of Echoes [P2]'] = {
		-- Tier 1
			['A0'] = { name = 'Dealan-dhe', 	zone = 279, index = 0, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131072},
			['A1'] = { name = 'Sgili', 			zone = 279, index = 1, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131073},
			['A2'] = { name = 'U Bnai', 		zone = 279, index = 2, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131074},
			['A3'] = { name = 'Gogmagog', 		zone = 279, index = 3, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131075},
		-- Tier 2				
			['A4'] = { name = 'Aristaeus', 		zone = 279, index = 4, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131076},
			['A5'] = { name = 'Raskovniche', 	zone = 279, index = 5, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131077},
			['A6'] = { name = 'Marmorkrebs', 	zone = 279, index = 6, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131078},
			['A7'] = { name = 'Gigelorum', 		zone = 279, index = 7, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131079},
			['A8'] = { name = 'Procne', 		zone = 279, index = 8, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131080},
			['A9'] = { name = 'Henwen', 		zone = 279, index = 9, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131081},
		-- Tier 3				
			['A10'] = { name = 'Xevioso', 		zone = 279, index = 10, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131082},
			['A11'] = { name = 'Ngai', 			zone = 279, index = 11, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131083},
			['A12'] = { name = 'Kalunga', 		zone = 279, index = 12, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131084},
			['A13'] = { name = 'Ongo', 			zone = 279, index = 13, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131085},
			['A14'] = { name = 'Mboze', 		zone = 279, index = 14, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131086},
			['A15'] = { name = 'Arebati', 		zone = 279, index = 15, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131087},
		-- Tier 4
			['A16'] = { name = 'Bumba', 		zone = 279, index = 16, x = -700.00006103516, z = -17.5, y = -174.00001525879, h = 191, baselevel = 131088},
		},
		['Walk of Echoes [P1]'] = {
		-- Tier 1
			['A0'] = { name = 'Dealan-dhe', 	zone = 298, index = 0, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131072},
			['A1'] = { name = 'Sgili', 			zone = 298, index = 1, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131073},
			['A2'] = { name = 'U Bnai', 		zone = 298, index = 2, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131074},
			['A3'] = { name = 'Gogmagog', 		zone = 298, index = 3, x = -420.00003051758, z = 19.5, y = -222.00001525879, h = 191, baselevel = 131075},
		-- Tier 2				
			['A4'] = { name = 'Aristaeus', 		zone = 298, index = 4, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131076},
			['A5'] = { name = 'Raskovniche', 	zone = 298, index = 5, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131077},
			['A6'] = { name = 'Marmorkrebs', 	zone = 298, index = 6, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131078},
			['A7'] = { name = 'Gigelorum', 		zone = 298, index = 7, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131079},
			['A8'] = { name = 'Procne', 		zone = 298, index = 8, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131080},
			['A9'] = { name = 'Henwen', 		zone = 298, index = 9, x = -420.00003051758, z = 13.500000953674, y = -92.000007629395, h = 191, baselevel = 131081},
		-- Tier 3				
			['A10'] = { name = 'Xevioso', 		zone = 298, index = 10, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131082},
			['A11'] = { name = 'Ngai', 			zone = 298, index = 11, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131083},
			['A12'] = { name = 'Kalunga', 		zone = 298, index = 12, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131084},
			['A13'] = { name = 'Ongo', 			zone = 298, index = 13, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131085},
			['A14'] = { name = 'Mboze', 		zone = 298, index = 14, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131086},
			['A15'] = { name = 'Arebati', 		zone = 298, index = 15, x = -700.00006103516, z = -0.1000000149012, y = -420.00003051758, h = 191, baselevel = 131087},
		-- Tier 4
			['A16'] = { name = 'Bumba', 		zone = 298, index = 16, x = -700.00006103516, z = -17.5, y = -174.00001525879, h = 191, baselevel = 131088},
		},
	},
}
