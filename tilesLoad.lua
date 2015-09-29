function loadTiles()
	tiles = {}

	tile21 = love.graphics.newImage('assets/blank.png')
	tile01 = love.graphics.newImage('assets/grass.png')
	tile02 = love.graphics.newImage('assets/treelower.png')
	tile03 = love.graphics.newImage('assets/treeupper.png')
	tile04 = love.graphics.newImage('assets/playerDown.png')
	tile05 = love.graphics.newImage('assets/playerUp.png')
	tile06 = love.graphics.newImage('assets/playerLeft.png')
	tile07 = love.graphics.newImage('assets/playerRight.png')
	tile08 = love.graphics.newImage('assets/playerWalkUp.png')
	tile09 = love.graphics.newImage('assets/playerWalkLeft.png')
	tile10 = love.graphics.newImage('assets/playerWalkRight.png')
	tile11 = love.graphics.newImage('assets/playerWalkDown.png')
	tile12 = love.graphics.newImage('assets/playerWalkDown2.png')
	tile13 = love.graphics.newImage('assets/playerWalkUp2.png')
	tile14 = love.graphics.newImage('assets/buildingMiddleBottom.png')
	tile15 = love.graphics.newImage('assets/buildingRightEdge.png')
	tile16 = love.graphics.newImage('assets/buildingLeftEdge.png')
	tile17 = love.graphics.newImage('assets/door.png')
	tile18 = love.graphics.newImage('assets/roofLeftEdge.png')
	tile19 = love.graphics.newImage('assets/roofMiddleTop.png')
	tile20 = love.graphics.newImage('assets/roofRightEdge.png')
	tile22 = love.graphics.newImage('assets/sign.png')
	tiles = { tile01,tile02,tile03,tile04,tile05,tile06,tile07,tile08,tile09,tile10,tile11,tile12,tile13,tile14,tile15,
		tile16,tile17,tile18,tile19,tile20,tile21,tile22 }

	return tiles
end

