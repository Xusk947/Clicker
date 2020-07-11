display.setDefault("magTextureFilter","nearest")

Button = require("core.button")
Particle = require("core.particle") -- Particle:new(x,y,rotation,image,width,height,velX,velY,speed,lifeTime)
require("core.fileDataLoader")
require("core.fileSystem")

math.randomseed( os.time() )

--Values
score = data.score or 0
upgradeLevel = data.upgradeLevel or 1
upgradeCost = data.upgradeCost or 10

--Buttons
coinButton = Button:new(display.contentCenterX,display.contentCenterY,"assets/coin.png",100,100)
coinButton.heat = 0
upgradeButton = Button:new(display.contentCenterX ,display.contentCenterY * 1.8,"assets/upgrade.png",200,50)

--Text
coins       = display.newText(ValueGroup,score,display.contentCenterX + 30, display.contentCenterY / 1.2,100,100)
upgradeText = display.newText(ValueGroup,upgradeCost,display.contentCenterX,display.contentCenterY * 1.6,100,100)

--BackGround
backGround = display.newImageRect( BackGroundGroup, "assets/background.png",display.viewableContentWidth * 2,display.viewableContentHeight * 2.2)
backGround.x = 0
backGround.y = 0

function click( event )
	local phase = event.phase
	if phase == "ended" then
		--coinButton.width  = coinButton.width  + 10
		--coinButton.height = coinButton.height + 10
		score = score + upgradeLevel
		coins.text = score
		if coinButton.heat <= 1.01 then
			coinButton.heat = coinButton.heat + 0.01
		end
		save("score = "..score.."\nupgradeLevel = "..upgradeLevel.."\nupgradeCost = "..upgradeCost)
	else 
		coinButton.width  = 100
		coinButton.height = 100
	end
end

function upgrade( event )
	local phase = event.phase
	if phase == "ended" and score >= upgradeCost  then
		score = score - upgradeCost
		upgradeCost = math.floor(upgradeCost * 1.3)
		upgradeButton.width  = upgradeButton.width  + 10
		upgradeButton.height = upgradeButton.height + 10
		upgradeLevel = upgradeLevel + 1
		upgradeText.text = upgradeCost
		coins.text = score
		save("score = "..score.."\nupgradeLevel = "..upgradeLevel.."\nupgradeCost = "..upgradeCost)
	else
		upgradeButton.width  = 200
		upgradeButton.height = 50
	end
end

function update()
	Particle:update()
	if coinButton.heat >= 0.5 then
		coinButton:setFillColor(coinButton.heat , 0.5 - coinButton.heat / 10, 0.5 - coinButton.heat / 10, 1 )
	else
		coinButton:setFillColor( 1, 1, 1, 1 )
	end

	if coinButton.heat >= 1 then
		heat = true
	end

	if heat then
		local rand = math.random( 25, 100 )
		local speedRand = math.random( 1,3 )
		Particle:new(math.random(0,display.viewableContentWidth),-100,0,"assets/cool.png",rand,rand,0,10,speedRand,math.random(1,3))
		coinButton:removeEventListener("touch", coinButton.func)
		coinButton.heat = coinButton.heat - 0.001

		if coinButton.heat <= 0.5 then
			coinButton.heat = 0
			heat = false
			coinButton:addEventListener("touch", coinButton.func)
		end
	end
end

timer.performWithDelay(10,update,0)
upgradeButton.newFunction(upgrade)
coinButton.newFunction(click)