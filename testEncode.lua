json = require 'json4lua/json/json'
mapData = {
	tiles = {
		{3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,1,1,22,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,3,2,3,2,1,1,3,2,3,2,3,2,3,2,3,2,3,2},
		{3,2,1,18,16,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,19,14,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,19,17,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,1,20,15,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2},
		{3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2},
		{21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21},
		{21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21}
	},

	portals = {
		{16,5,0,16,6}
	},

	objects = {
		tree = { sprites = {2,3}, passable = false, class = 'env', interactable = false },
		grass = {sprites = {1}, passable = true, class = 'env', interactable = false},
		building = { sprites = {14,15,16,18,19,20}, passable = false, class = 'env', interactable = false },
		door = {sprites = {17}, passable = true, portal = true, class = 'env', interactable = false},
		sign = {sprites = {22}, passable = false, portal = false, message = "Hello world!", interactable = true, class = 'talk'}
	}
}

out = json.encode(mapData)
--io.input("test0")
--out = io.read("*all")


print(out)
res = json.decode(out)
print(res.tiles[1][3])
for k,v in pairs(res.tiles) do
	for i,j in pairs(v) do print(i,j) end
end
io.output("map1.json")

io.write(out)
