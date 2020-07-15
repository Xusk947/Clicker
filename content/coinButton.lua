Ui = require("core.ui")
Particle = require("core.particle") -- Particle:new(x,y,rotation,image,width,height,velX,velY,speed,lifeTime)

coinButton = Button:new(display.contentCenterX,display.contentCenterY,"assets/coin.png",100,100)
coinButton.heat = 0

lvl = Ui:new(display.contentCenterX,display.contentCenterY / 2.2,"assets/lvl-back.png",50,50)
lvl.newLine("assets/lvl.png")
lvl.newText("lvl")
lvl.text:setFillColor( 0.4, 0.4, 1, 1)

function click( event )
	local phase = event.phase
	if (phase == "moved" or phase == "ended") and heat == false  then
		---coinButton.width  = coinButton.width  + 10
		---coinButton.height = coinButton.height + 10

		score = score  + math.floor((upgradeLevel * (1 + lvlLevel / 100 )))
		coins.text = score

		if coinButton.heat <= 1.01 then
			coinButton.heat = coinButton.heat + 0.001

			lvlClick = lvlClick + 1

			if lvlClick > lvlClickMax * lvlLevel then
				lvlClickMax = math.floor(lvlClickMax * 1.1)
				lvlClick = 0
				lvlLevel = lvlLevel + 1

				for i=1, 10 do
					local rand = math.random( 35, 50 )
					local speedRand = math.random( 1,3 )
					local x = math.random(0,display.viewableContentWidth)
					local part = Particle:new(x,-100,0,"assets/exp.png",rand,rand,0,10,speedRand,math.random(1,3),100,group)
				end
			end

			local rand = math.random( 35, 50 )
			local speedRand = math.random( 1,3 )
			Particle:new(math.random(0,display.viewableContentWidth),-100,0,"assets/coin.png",rand,rand,0,10,speedRand,math.random(1,3),100,BackParticleGroup)
			if coinButton.heat > 0.7 then 
				Particle:new(math.random(0,display.viewableContentWidth),display.viewableContentHeight + 100,0,"assets/fire.png",rand,rand,0,-10,speedRand,math.random(1,3))
			end
		end
		save("score = "..score.."\nupgradeLevel = "..upgradeLevel.."\nupgradeCost = "..upgradeCost.."\nlvlLevel = "..lvlLevel.."\nlvlClick = "..lvlClick.."\nlvlClickMax = "..lvlClickMax)
	else 
		coinButton.width  = 100
		coinButton.height = 100
	end

	if phase == "ended" and heat then
		coinButton.heat = 1
		local rand = math.random( 35, 50 )
		local speedRand = math.random( 1,3 )
		Particle:new(math.random(0,display.viewableContentWidth),display.viewableContentHeight + 100,0,"assets/fire.png",rand,rand,0,-10,speedRand,math.random(1,3))
	end
end

coinButton.newFunction(click)