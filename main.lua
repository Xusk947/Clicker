display.setDefault("magTextureFilter","nearest")

coin = display.newImageRect( "assets/coin.png", 100,100)
coin.x = display.contentCenterX
coin.y = display.contentCenterY
coin.heat = 0
coins = 0

tapBonus = 1

upgradeCost = 10

coinsText = display.newText(coins, display.contentCenterX , display.contentCenterY / 2)
cost = display.newText(upgradeCost, display.contentCenterX , display.contentCenterY * 1.8)
upgrade = display.newImageRect( "assets/upgrade.png",200,50 )
upgrade.x = display.contentCenterX 
upgrade.y = display.contentCenterY * 2
function tap( event )
	if event.phase == "begin" or  event.phase == "ended" or event.phase == "moved" then 
		coins = coins + tapBonus
		coinsText.text = coins
		--coin.width = coin.width + 10
		--coin.height = coin.height + 10
		coin.heat = coin.heat + 0.01
		if coin.heat < 0.1 then 
			coin:setFillColor( 1,1,1,1)
		else
			coin:setFillColor( coin.heat, 0.5,0.5, 1 )
		end
	else
		coin.width = 100
		coin.height = 100
	end
end

function upgradee( event )
	if event.phase == "begin" or event.phase == "ended" or event.phase == "moved" and coins >= upgradeCost then
		tapBonus = tapBonus + 1
		coins = coins - upgradeCost
		coinsText.text = coins
		upgradeCost = math.floor( upgradeCost * 1.5 )
		cost.text = upgradeCost
		upgrade.width = upgrade.width + 10
		upgrade.height = upgrade.height + 10
	else
		upgrade.width = 200
		upgrade.height = 50
	end
end

function update()
	coin.heat = coin.heat - 0.01
	if coin.heat < 0.3 then 
		coin:setFillColor( 1,1,1,1)
	else
		coin:setFillColor( coin.heat, 0.5, 0.5, 1 )
	end
end

timer.performWithDelay( 1,update() )
coin:addEventListener( "touch", tap )
upgrade:addEventListener( "touch", upgradee )