json = require 'json4lua/json/json'


function saveNPCS(npcs)
	npcListFile = io.open("retrocrossing/npcs/list.json","w")
	out = json.encode(npcs)
	npcListFile:write(out)
	npcListFile:close()
	for n in npcs do
		name = n.name
		npcFile = io.open("retrocrossing/npcs/"..name..".json","w")
		out = json.encode(n)
		npcFile:write(out)
		npcFile:close()
	end
end

function loadNPCS()
	listFile = io.open("retrocrossing/npcs/list.json","r")
	input = listFile:read("*all")
	npcs = json.decode(input)
	listFile:close()

	for n in npcs do
		name = n
		npcFile = io.open("retrocrossing/npcs/"..name..".json","r")
		input = npcFile:read("*all")
		n = json.decode(input)
		npcFile:close()
	end
	return npcs
end
