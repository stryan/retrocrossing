require "playerIO"
require "mapIO"


-- screen can only show 20x18 tiles (160x144 pixels), but many games use ...
maxTilesWidth = 20
maxTilesHeight = 20
player = loadPlayer() 
moveTimerMax = .2
moveTimer = moveTimerMax
map = {}

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function adjustPlayerTile()
	if not love.keyboard.isDown('left','right','up','down') then
		if player.direction == 'n' then player.tile = 5
		elseif player.direction == 's' then player.tile = 4
		elseif player.direction == 'e' then player.tile = 7
		elseif player.direction == 'w' then player.tile = 6 end
	end
end

function checkIfNotSolid(tileNum)
	for _,obj in pairs(map.objects) do
		if table.contains(obj.sprites,tileNum) then return obj.passable end
	end
	print("Object not found!")
end

function checkForPortal(tileNum,player)
	for _,obj in pairs(map.portals) do
		if obj[1] == player.x and obj[2] == player.y  then
			print("Found portal!")
			player.map = obj[3]
			player.x = obj[4]
			player.y = obj[5]
			map = loadMap(0,player,player.map)
		end
	end
	return player
end

function love.load(arg)
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
	tiles = { tile01,tile02,tile03,tile04,tile05,tile06,tile07,tile08,tile09,tile10,tile11,tile12,tile13,tile14,tile15,
		tile16,tile17,tile18,tile19,tile20,tile21 }
	map = loadMap(0,player,player.map)
	--playerIO.loadPlayer(player)
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end
	if love.keyboard.isDown('s') then
		print("saving player")
		savePlayer(player)
	end
	if love.keyboard.isDown('l') then
		player = loadPlayer()
		map = loadMap(0,player,player.map)
		print("loaded save data")
	end
	if love.keyboard.isDown('9') then
		print("redrawing map")
		map = loadMap(0,player,player.map)
	end
	if moveTime == moveTimeMax then adjustPlayerTile() end
	moveTimer = moveTimer - (1 * dt)
	if moveTimer < 0  and love.keyboard.isDown('left','right','up','down') then
		cx = player.x
		cy = player.y
		if love.keyboard.isDown('left') then
			if checkIfNotSolid(map.tiles[cx-1][cy]) then
				player.x = player.x - 1
				if player.tile == 9 then player.tile = 6
				else player.tile = 9 end
			end
			player.direction = 'w'
		elseif love.keyboard.isDown('right') then
			if checkIfNotSolid(map.tiles[cx+1][cy]) then
				player.x = player.x + 1
				player.direction = 'e'
				if player.tile == 10 then player.tile = 7
				else player.tile = 10 end
			end
			player.direction = 'e'
		elseif love.keyboard.isDown('up') then
			if checkIfNotSolid(map.tiles[cx][cy-1]) then
				player.y = player.y - 1
				player.direction = 'n'
				if player.tile == 8 then player.tile = 13
				else player.tile = 8 end
			end
			player.direction = 'n'
		elseif love.keyboard.isDown('down') then
			if checkIfNotSolid(map.tiles[cx][cy+1]) then
				player.y = player.y + 1
				player.direction = 's'
				if player.tile == 11 then player.tile = 12
				else player.tile = 11 end
			end
			player.direction = 's'
		end
		moveTimer = moveTimerMax
	end
	player = checkForPortal(map.tiles[player.x][player.y],player)
end

function love.draw(dt)
	for i = 1,maxTilesHeight do
		for j = 1,maxTilesWidth do
			currentTile = map.tiles[i][j]
			love.graphics.draw(tiles[currentTile],(i)*16,(j)*16)
		end
	end
	love.graphics.draw(tiles[player.tile],(player.x)*16,(player.y)*16)
end
