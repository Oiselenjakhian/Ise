-- Hide Status Bar
display.setStatusBar(display.HiddenStatusBar)

-- Create images as variables
local image0 = { type="image", filename="0.png" }
local image1 = { type="image", filename="1.png" }
local image2 = { type="image", filename="2.png" }
local image3 = { type="image", filename="3.png" }
local image4 = { type="image", filename="4.png" }
local image5 = { type="image", filename="5.png" }
local image6 = { type="image", filename="6.png" }
local image7 = { type="image", filename="7.png" }
local image8 = { type="image", filename="8.png" }
local image9 = { type="image", filename="9.png" }
local image10 = { type="image", filename="10.png" }
local image11 = { type="image", filename="11.png" }
local image12 = { type="image", filename="12.png" }
local image13 = { type="image", filename="13.png" }
local image14 = { type="image", filename="14.png" }
local image15 = { type="image", filename="15.png" }
local image16 = { type="image", filename="16.png" }
local image17 = { type="image", filename="17.png" }
local image18 = { type="image", filename="18.png" }
local image19 = { type="image", filename="19.png" }
local image20 = { type="image", filename="20.png" }
local image24 = { type="image", filename="24.png" }
local image28 = { type="image", filename="28.png" }
local image32 = { type="image", filename="32.png" }
local image36 = { type="image", filename="36.png" }
local image40 = { type="image", filename="40.png" }
local image44 = { type="image", filename="44.png" }
local image48 = { type="image", filename="48.png" }

-- Assign image variables to a table
local potImages = {
	image0,
	image1,
	image2,
	image3,
	image4,
	image5,
	image6,
	image7,
	image8,
	image9,
	image10,
	image11,
	image12,
	image13,
	image14,
	image15,
	image16,
	image17,
	image18,
	image19,
	image20,
	image24,
	image28,
	image32,
	image36,
	image40,
	image44,
	image48
}

-- Menu Screen
local menuScreenGroup
local mmScreen
local playBtn

-- Game Screen
local background
local hand1
local hand2
local pot1
local pot2
local pot3
local pot4
local pot5
local pot6
local playerOneScore
local pot7
local pot8
local pot9
local pot10
local pot11
local pot12
local playerTwoScore

-- Variables
local _W = display.contentWidth / 2
local _H = display.contentHeight / 2
local board = {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4}
local currentPot
local nextPot
local seedsHeldInPot
local potSeeds

-- Timer variables
local timer1

-- First function called by the program
function main()
	--printBoard()
	mainMenu()
end

-- Print out the contents of the board table
function printBoard()
	for i = 1, #board do
		print("Pot Number:"..i.." Value: "..board[i])
	end
	print("")
end

-- Display the main menu
function mainMenu()
	menuScreenGroup = display.newGroup()
	
	mmScreen = display.newImage("mmScreen.png", 0, 0, true)
	mmScreen.x = _W
	mmScreen.y = _H
	
	playBtn = display.newImage("playbtn.png")
	playBtn.anchorX = 0.5
	playBtn.anchorY = 0.5
	playBtn.x = _W; playBtn.y = _H + 50
	playBtn.name = "playbutton"
	
	menuScreenGroup:insert(mmScreen)
	menuScreenGroup:insert(playBtn)
	
	playBtn:addEventListener("tap", loadGame)
end

function loadGame(event)
	if event.target.name == "playbutton" then
		transition.to(menuScreenGroup, {time = 0, alpha = 0, onComplete = addGameScreen})
		playBtn:removeEventListener("tap", loadGame)
	end
end

function addGameScreen()
	background = display.newImage("board.png", 0, 0, true )
	background.x = _W 
	background.y = _H
	
	hand1 = display.newImage("hand1.png")
	hand1.x = 244; hand1.y = 592
	hand1.name = "hand1"
	
	hand2 = display.newImage("hand2.png")
	hand2.x = 784; hand2.y = 176
	hand2.name = "hand2"
	
	pot1 = display.newRect(0, 0, 48, 48)
	pot1.x = 244; pot1.y = 492
	pot1.fill = image4
	pot1.id = 1
	pot1:addEventListener("tap", setPotID)
	
	pot2 = display.newRect(0, 0, 48, 48)
	pot2.x = 352; pot2.y = 492
	pot2.fill = image4
	pot2.id = 2
	pot2:addEventListener("tap", setPotID)
	
	pot3 = display.newRect(0, 0, 48, 48)
	pot3.x = 460; pot3.y = 492
	pot3.fill = image4
	pot3.id = 3
	pot3:addEventListener("tap", setPotID)
	
	pot4 = display.newRect(0, 0, 48, 48)
	pot4.x = 568; pot4.y = 492
	pot4.fill = image4
	pot4.id = 4
	pot4:addEventListener("tap", setPotID)
	
	pot5 = display.newRect(0, 0, 48, 48)
	pot5.x = 676; pot5.y = 492
	pot5.fill = image4
	pot5.id = 5
	pot5:addEventListener("tap", setPotID)
	
	pot6 = display.newRect(0, 0, 48, 48)
	pot6.x = 784; pot6.y = 492
	pot6.fill = image4
	pot6.id = 6
	pot6:addEventListener("tap", setPotID)
	
	playerOneScore = display.newRect(0, 0, 48, 48)
	playerOneScore.fill = image0
	playerOneScore.x = 888; playerOneScore.y = 384
	
	pot7 = display.newRect(0, 0, 48, 48)
	pot7.x = 784; pot7.y = 280
	pot7.fill = image4
	pot7.id = 7
	pot7:addEventListener("tap", setPotID)
	
	pot8 = display.newRect(0, 0, 48, 48)
	pot8.x = 676; pot8.y = 280
	pot8.fill = image4
	pot8.id = 8
	pot8:addEventListener("tap", setPotID)
	
	pot9 = display.newRect(0, 0, 48, 48)
	pot9.x = 568; pot9.y = 280
	pot9.fill = image4
	pot9.id = 9
	pot9:addEventListener("tap", setPotID)
	
	pot10 = display.newRect(0, 0, 48, 48)
	pot10.x = 460; pot10.y = 280
	pot10.fill = image4
	pot10.id = 10
	pot10:addEventListener("tap", setPotID)
	
	pot11 = display.newRect(0, 0, 48, 48)
	pot11.x = 352; pot11.y = 280
	pot11.fill = image4
	pot11.id = 11
	pot11:addEventListener("tap", setPotID)
	
	pot12 = display.newRect(0, 0, 48, 48)
	pot12.x = 244; pot12.y = 280
	pot12.fill = image4
	pot12.id = 12
	pot12:addEventListener("tap", setPotID)
	
	playerTwoScore = display.newImage("0.png")
	playerTwoScore.fill = image0
	playerTwoScore.x = 140; playerTwoScore.y = 384
end

function setPotID(event)
	currentPot = event.target.id
	--print(currentPot)
	seedsHeldInPot = seedsHeld(currentPot)
	print(seedsHeldInPot)
	
	if seedsHeldInPot == 0 then
		--Don't pick from the empty pot
	else
		pickSeeds(currentPot)
		distributeSeeds()
	end
end

function seedsHeld(potID)
	return board[potID]
end

function pickSeeds(potID)
	board[potID] = 0
	--printBoard()
	changeImage(potID, 0)
end

function distributeSeeds()
	Clock1()
end

--Change the image in a pot to match the number of seeds in the pot
function changeImage(potID, imageValue)
	-- Shift by 1 because image0 is at the first position
	imageValue = imageValue + 1

	if potID ==  1 then
		pot1.fill = potImages[imageValue]
	elseif potID ==  2 then
		pot2.fill = potImages[imageValue]
	elseif potID ==  3 then
		pot3.fill = potImages[imageValue]
	elseif potID ==  4 then
		pot4.fill = potImages[imageValue]
	elseif potID ==  5 then
		pot5.fill = potImages[imageValue]
	elseif potID ==  6 then
		pot6.fill = potImages[imageValue]
	elseif potID ==  7 then
		pot7.fill = potImages[imageValue]
	elseif potID ==  8 then
		pot8.fill = potImages[imageValue]
	elseif potID ==  9 then
		pot9.fill = potImages[imageValue]
	elseif potID ==  10 then
		pot10.fill = potImages[imageValue]
	elseif potID ==  11 then
		pot11.fill = potImages[imageValue]
	elseif potID ==  12 then
		pot12.fill = potImages[imageValue]
	end
end

function Clock1()
	function tick()
		if seedsHeldInPot == 0 then
			timer.cancel(timer1)
		else
			nextPot = getNextPot(currentPot)
			addSeeds(nextPot)
			seedsHeldInPot = seedsHeldInPot - 1
			currentPot = nextPot
		end
	end
	
	timer1 = timer.performWithDelay(1000, tick, 0)
end

function getNextPot(currentPot)
	--print((currentPot % 12) + 1)
	return (currentPot % 12) + 1
end

function addSeeds(potID)
	-- Get the seeds in the pot at the selected pot id and increase it
	potSeeds = board[potID] + 1
	
	-- Change the value at the index position
	board[potID] = potSeeds
	
	printBoard()
	changeImage(potID, potSeeds)
end

main()