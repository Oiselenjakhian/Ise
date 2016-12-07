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
-- image20 at index 21
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
local potOneScore
local pot7
local pot8
local pot9
local pot10
local pot11
local pot12
local potTwoScore

-- Variables
local _W = display.contentWidth / 2
local _H = display.contentHeight / 2
local board = {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4}
local currentPot
local nextPot
local seedsHeldInPot
local potSeeds
local playerID = 1
local distributionInProgress = false
local playerOneScore = 0
local playerTwoScore = 0

-- Timer variables
local timer1
local timer2

-- First function called by the program
function main()
	mainMenu()
end

-- Print out the contents of the board table
function printBoard()
	for i = 1, #board do
		print("Pot Number:"..i.." Value: "..board[i])
	end
	print("-----------------------------------------")
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

-- Move from the menu to the game screen
function loadGame(event)
	if event.target.name == "playbutton" then
		transition.to(menuScreenGroup, {time = 0, alpha = 0, onComplete = addGameScreen})
		playBtn:removeEventListener("tap", loadGame)
	end
end

-- Game Screen
function addGameScreen()
	background = display.newImage("board.png", 0, 0, true )
	background.x = _W 
	background.y = _H
	
	hand1 = display.newImage("hand1.png")
	hand1.x = 514; hand1.y = 592
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
	
	-- Gets a pot id of 13 because it is a store house
	potOneScore = display.newRect(0, 0, 48, 48)
	potOneScore.fill = image0
	potOneScore.id = 13
	potOneScore.x = 888; potOneScore.y = 384
	
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
	
	-- Gets a pot id of 14 because it is a store house
	potTwoScore = display.newImage("0.png")
	potTwoScore.fill = image0
	potTwoScore.id = 14
	potTwoScore.x = 140; potTwoScore.y = 384
end

function setPotID(event)
	if distributionInProgress then
		
	else
		currentPot = event.target.id
		seedsHeldInPot = seedsHeld(currentPot)
		
		if seedsHeldInPot == 0 then
			--Don't pick from the empty pot
		else
			if playerID == getPlayerID(currentPot) then
				pickSeeds(currentPot)
				distributeSeeds()
			else
			
			end
		end
	end
end

function seedsHeld(potID)
	return board[potID]
end

function pickSeeds(potID)
	board[potID] = 0
	changeImage(potID, 0)
end

function distributeSeeds()
	Clock1()
	distributionInProgress = true
end

--Change the image in a pot to match the number of seeds in the pot
function changeImage(potID, imageValue)
	-- Compensate for image0 being in first place and for image values above 16
	-- Hard code the index values for image values above 16
	if imageValue > 19 then
		if imageValue == 20 then
			imageValue = 21
		elseif imageValue == 24 then
			imageValue = 22
		elseif imageValue == 28 then
			imageValue = 23
		elseif imageValue == 32 then
			imageValue = 24
		elseif imageValue == 36 then
			imageValue = 25
		elseif imageValue == 40 then
			imageValue = 26
		elseif imageValue == 44 then
			imageValue = 27
		elseif imageValue == 48 then
			imageValue = 28
		end
	else
		imageValue = imageValue + 1
	end

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
	elseif potID ==  13 then
		potOneScore.fill = potImages[imageValue]
	elseif potID ==  14 then
		potTwoScore.fill = potImages[imageValue]	
	end
end

-- Main engine of the entire application
function Clock1()
	function tick1()
		if seedsHeldInPot == 0 then
			timer.pause(timer1)
			distributionInProgress = false

			if playerID == 1 then
				-- Check if the player 2 pots are empty
				if sumPlayerTwoSeeds() == 0 then
					-- Allow the first player to replay
					playerID = 1
				else
					-- Switch to player 2
					playerID = 2
				end
			else
				-- Check if the player 1 pots are empty
				if sumPlayerOneSeeds() == 0 then
					-- Allow the second player to replay
					playerID = 2
				else
					-- Switch to player 1
					playerID = 1
				end
			end
		else
			nextPot = getNextPot(currentPot)
			addSeeds(nextPot)
			seedsHeldInPot = seedsHeldInPot - 1
			currentPot = nextPot
			
			-- Test if we can do relay sowing
			if seedsHeldInPot == 0 then
				if potSeeds > 1 and potSeeds ~= 4 then
					seedsHeldInPot = seedsHeld(currentPot)
					timer.pause(timer1)
					Clock2()
				elseif potSeeds == 1 then
					seedsHeldInPot = 0
				elseif potSeeds == 4 then
					seedsHeldInPot = 0
					timer.pause(timer1)
					Clock2()
				end
			else
				if potSeeds == 4 then
					timer.pause(timer1)
					Clock2()
				end
			end
		end
	end
	
	timer1 = timer.performWithDelay(1000, tick1, -1)
end

-- Clock 2 works with Clock 1 to show seed capture
function Clock2()
	function tick2()
		pickSeeds(currentPot)
		Clock1()
		timer.pause(timer2)
		
		if seedsHeldInPot == 0 then
			scorePlayer()
		elseif potSeeds == 4 then
			scorePotOwner(currentPot)
		end
	end
	
	timer2 = timer.performWithDelay(1000, tick2, -1)
end

function getNextPot(currentPot)
	return (currentPot % 12) + 1
end

function addSeeds(potID)
	-- Get the seeds in the pot at the selected pot id and increase it
	potSeeds = board[potID] + 1
	
	-- Change the value at the index position
	board[potID] = potSeeds
	
	-- Change the image displayed for the pot
	changeImage(potID, potSeeds)
end

-- Return the player ID. 1 for user, 2 for computer
function getPlayerID(potID)
	if potID < 7 then
		return 1
	else
		return 2
	end
end

-- Find the sum of seeds in pots 1 to 6
function sumPlayerOneSeeds()
	return board[1] + board[2] + board[3] + board[4] + board[5] + board[6]
end

-- Find the sum of seeds in pots 7 to 12
function sumPlayerTwoSeeds()
	return board[7] + board[8] + board[9] + board[10] + board[11] + board[12]
end

-- Find the total number of seeds in all the potSeeds
function sumTotalSeeds()
	return sumPlayerOneSeeds() + sumPlayerTwoSeeds()
end

-- Score the player who played a round
function scorePlayer()
	if playerID == 1 then
		if sumTotalSeeds() == 4 then
			playerOneScore = playerOneScore + 8
			changeImage(13, playerOneScore)
			gameOver()
		else
			playerOneScore = playerOneScore + 4
			changeImage(13, playerOneScore)
		end
	else
		if sumTotalSeeds() == 4 then
			playerTwoScore = playerTwoScore + 8
			changeImage(14, playerTwoScore)
			gameOver()
		else
			playerTwoScore = playerTwoScore + 4
			changeImage(14, playerTwoScore)
		end
	end
end

function scorePotOwner(currentPot)
	if currentPot < 7 then
		if sumTotalSeeds() == 4 then
			playerOneScore = playerOneScore + 8
			changeImage(13, playerOneScore)
			gameOver()
		else
			playerOneScore = playerOneScore + 4
			changeImage(13, playerOneScore)
		end
	else
		if sumTotalSeeds() == 4 then
			playerTwoScore = playerTwoScore + 8
			changeImage(14, playerTwoScore)
			gameOver()
		else
			playerTwoScore = playerTwoScore + 4
			changeImage(14, playerTwoScore)
		end
	end
end

function gameOver()

end

function restartGame()

end

function resetList()

end

function resetVariables()

end

function resetPotImages()

end

main()