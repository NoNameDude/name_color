--If its a Nil value its white :)
minetest.register_on_joinplayer(function(player)
	if player:get_attribute("name_color") == nil then
		player:set_attribute("name_color", "white")
	end
end)





--Color Table Value
--Do Not Add more color since your also not also updating the formspec
name_colors = {
	red = "#FF0000",
	white = "#FFFFFF",
	blue =  "#0000FF",
	green =	"#008000",
	yellow = "#FFFF00",
	black = "#000000"
}



--Send chat part
minetest.register_on_chat_message(function(name, message)
    local player = minetest.get_player_by_name(name) --The command user's userdata
 
    minetest.chat_send_all("<"..minetest.colorize(name_colors[player:get_attribute("name_color")], name).."> "..message)
	
	return true
end)




dofile(minetest.get_modpath("name_color").."/commands.lua")
