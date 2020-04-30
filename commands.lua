--Chatcommand Player to set a color
minetest.register_chatcommand("name_color", {
	description = "Set the color of your name",
	privs = {interact=true},
	func = function(name, param)
	local player = minetest.get_player_by_name(name)
	local current_color = player:get_attribute("name_color")
		if not player then
			return
		end
		
		--prefent a crash if something totaly went wrong
		if current_color == nil then
			return
		end
		
		--All values from the table up
		if param == "red" or param == "white" or param == "blue" or param == "green" or param == "yellow" or param == "black" then
			--Update color
			player:set_attribute("name_color", param)
			minetest.chat_send_player(name,""..minetest.colorize(name_colors[param], "Your color updated to " ..param..""))
		else
			minetest.chat_send_player(name, "This is not a color we support")
			return true
		end
	
	end
	
})


minetest.register_chatcommand("set_name_color", {
	description = "set the name color of a player",
	privs = {server=true},
	func = function(name, param)
	local target = param:split(' ')[1]
	local player = minetest.get_player_by_name(target)
	local param2 = param:split(' ')[2]
	
	--Anticrash if Player is a Nil value than return
		if not player then
			minetest.chat_send_player(name, "The Player has to be online to run this command ;D")
			return
		end
	
	
	--if player is online do the function
	local current_color = player:get_attribute("name_color")

		
		--prefent a crash if something goes totaly wrong
		if current_color == nil then
			return
		end
		
		--Prefent also a crash
		if param2 == "" then
			return
		end
		
		--All values from the table up
		if param2 == "red" or param2 == "white" or param2 == "blue" or param2 == "green" or param2 == "yellow" or param2 == "black" then
			--Update color
			player:set_attribute("name_color", param2)
			minetest.chat_send_player(name,""..minetest.colorize(name_colors[param2], "Your color updated to " ..param2..""))
		else
			minetest.chat_send_player(name, "This is not a color we support")
			return true
		end
	
	end
	
})



minetest.register_chatcommand("name_help", {
	description = "Show's you all commands to change the color of your name",
	privs = {interact=true},
	func = function(name, param)
	local player = minetest.get_player_by_name("name")
	minetest.chat_send_player(name,"You can run /name_color to change the color of your name we support the colors RED, WHITE, BLUE, GREEN, YELLOW, BLACK")
	end
})

