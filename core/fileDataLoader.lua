require("core.fileSystem")
file = read()

data = {}
local key
if file ~= nil then
	for value in string.gmatch(file, "score =%s*(%d+)") do 
		data.score = tonumber(value)
	end

	for value in string.gmatch(file, "upgradeLevel =%s*(%d+)") do 
		data.upgradeLevel = tonumber(value)
	end

	for value in string.gmatch(file, "upgradeCost =%s*(%d+)") do 
		data.upgradeCost = tonumber(value)
	end
end