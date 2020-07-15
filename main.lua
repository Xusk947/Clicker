require("core.fileDataLoader")
require("core.fileSystem")
Button = require("core.button")
Particle = require("core.particle") -- Particle:new(x,y,rotation,image,width,height,velX,velY,speed,lifeTime)
display.setDefault("magTextureFilter","nearest")


math.randomseed( os.time() )

--Values
heat = false
score = data.score or 0
upgradeLevel = data.upgradeLevel or 1
upgradeCost = data.upgradeCost or 10
lvlLevel = data.levelLevel or 0
lvlClick = data.lvlClick or 0
lvlClickMax = data.lvlClickMax or 100
require("content.coinButton")
require("content.upgradeButton")

--Text
coins       = display.newText(ValueGroup,score,display.contentCenterX + 30, display.contentCenterY / 1.2,100,100)
upgradeText = display.newText(ValueGroup,upgradeCost,display.contentCenterX,display.contentCenterY * 1.6,100,100)

--BackGround
backGround = display.newImageRect( BackGroundGroup, "assets/background.png",display.viewableContentWidth * 2,display.viewableContentHeight * 2.5)
backGround.x = 0
backGround.y = 0



function update()

	Particle:update()

	if coinButton.heat >= 0.5 then
		coinButton:setFillColor(coinButton.heat , 0.5 - coinButton.heat / 10, 0.5 - coinButton.heat / 10, 1 )
	else
		coinButton:setFillColor( 1, 1, 1, 1 )
	end
	lvl.alpha = (lvlClick / 100) / lvlLevel
	if coinButton.heat >= 1 then
		heat = true
	end

	if heat then
		coins.text = "Coin Heat"
		coins:setFillColor( 0.4, 0.4, 1, 1 )
		local rand = math.random( 35, 100 )
		local speedRand = math.random( 1,3 )
		local x = math.random(0,display.viewableContentWidth)
		local group = ParticleGroup
		if rand > 65 then 
			group = ParticleGroup
		else
			group = BackParticleGroup
		end
		local part = Particle:new(x,-100,0,"assets/cool.png",rand,rand,0,10,speedRand,math.random(1,3),100,group)
		if part ~= nil then
			part:setFillColor( rand /  100,rand /  100,rand /  100, 1 )
		end
		coinButton.heat = coinButton.heat - 0.001

		if coinButton.heat <= 0.5 then
			coinButton.heat = 0
			heat = false
		end
	else
		coins.text = score
		coins:setFillColor( 1, 1, 1, 1 )
	end
end


timer.performWithDelay(10,update,0)
