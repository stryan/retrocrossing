json = require 'json4lua/json/json'

npcData = {
	name = "Borris",
	map = 1,
	sprites = {},
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
