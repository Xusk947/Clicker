upgradeButton = Button:new(display.contentCenterX ,display.contentCenterY * 1.8,"assets/upgrade.png",200,50)

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
		save("score = "..score.."\nupgradeLevel = "..upgradeLevel.."\nupgradeCost = "..upgradeCost.."\nlvlLevel = "..lvlLevel.."\nlvlClick = "..lvlClick.."\nlvlClickMax = "..lvlClickMax)
	else
		upgradeButton.width  = 200
		upgradeButton.height = 50
	end
end

upgradeButton.newFunction(upgrade)