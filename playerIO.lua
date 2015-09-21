json = require 'json4lua/json/json'

function savePlayerOld(player)
	saveFile = love.filesystem.newFile("save.dat")
	saveFile:open("w")
	position = tostring(player.x).." "..tostring(player.y)
	saveFile:write(position)
	saveFile:flush()
	saveFile:close()
end

function savePlayer(player)
	saveFile = io.open("retrocrossing/savedata/player.json","w")
	out = json.encode(player)
	saveFile:write(out)
	saveFile:close()
end

function loadPlayerOld(player)
	if love.filesystem.exists("save.dat") then
		saveFile = love.filesystem.newFile("save.dat")
		saveFile:open("r")
		contents,size = saveFile:read(8)
		x,y = string.match(contents,"(%d+) (%d+)")
		player.x = tonumber(x)
		player.y = tonumber(y)
		saveFile:close()
		return player
	end
end

function loadPlayer()
	saveFile = io.open("retrocrossing/savedata/player.json","r")
	input = saveFile:read("*all")
	player = json.decode(input)
	saveFile:close()
	return player
end
