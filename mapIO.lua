json = require 'json4lua/json/json'

function split(source, delimiters)
        local elements = {}
        local pattern = '([^'..delimiters..']+)'
        string.gsub(source, pattern, function(value) elements[#elements + 1] =     value;  end);
        return elements
end

function printArray(arr)
	for x,y in pairs(arr) do
		io.write(y.." ")
	end
	print()
end

function convertArrayToInt(arr)
	for x,y in pairs(arr) do
		arr[x] = tonumber(y)
	end
	return arr
end

function loadPortals(mapNum)
	portalsFile = love.filesystem.newFile("portals"..tostring(mapNum))
	portalsFile:open("r")
	doors = {}
	newDoor = {}
	porIter = portalsFile:lines()
	i = 1
	for door in porIter do
		x,y,m,s,t = string.match(door,"(%d+),(%d+),(%d+),(%d+),(%d+)")
		pX = tonumber(x)
		pY = tonumber(y)
		toMap = tonumber(m)
		toX = tonumber(s)
		toY = tonumber(t)
		newDoor = {pX,pY,toMap,toX,toY}
		doors[i] = newDoor
		i = i +1
	end
	return doors
end


function loadMapOLD(fromMap, player, mapNumber)
	mapName = "map"..tostring(mapNumber)
	mapFile = love.filesystem.newFile(mapName)
	mapFile:open("r")
	map = {}
	mapIter = mapFile:lines()
	mapPos = 1
	for x in mapIter do
		res = split(x,",")
		map[mapPos] = convertArrayToInt(res)
		mapPos = mapPos + 1
	end

	mapFile:close()
	newMap = { tiles = map,portals = loadPortals(mapNumber)}
	return newMap
end

function loadMap(fromMap, player, mapNumber)
	mapFile = "retrocrossing/maps/map"..tostring(mapNumber)..".json"
	mapFile = io.open(mapFile,"r")
	input = mapFile:read("*all")
	map = json.decode(input)
	mapFile:close()
	return map
end
