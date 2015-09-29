json = require 'json4lua/json/json'

npcData = {
	name = "Borris",
	map = 1,
	sprites = {4,5,6,7,8,9,10,11,12,13},
	tile = 6,
	passable = false,
	x = 5,
	y = 7,
}


out = json.encode(npcData)
--io.input("test0")
--out = io.read("*all")


print(out)
res = json.decode(out)
io.output("npcs/Borris.json")

io.write(out)
