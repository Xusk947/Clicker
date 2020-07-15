require("core.displayGroup")

local Particle = {}
parts = {}

function Particle:new(x,y,rotation,image,width,height,velX,velY,speed,rotationSpeed,lifeTime,group)
	if #parts <= 250 then
		local particle = display.newImageRect( group or ParticleGroup,image, width, height )
		particle.x = x
		particle.y = y
		particle.rotation = rotation
		particle.velX = velX
		particle.velY = velY
		particle.speed = speed
		particle.rotationSpeed = rotationSpeed
		particle.lifeTime = lifeTime or 100
		table.insert( parts, particle )
		return particle
	end
end

function Particle:update()
	for i,particle in ipairs(parts) do
		if particle.lifeTime <= 0 then display.remove( particle ) table.remove(parts,i) end
		particle.lifeTime = particle.lifeTime - 1
		particle.x = (particle.x + particle.velX) * particle.speed
		particle.y = (particle.y + particle.velY) * particle.speed
		particle.rotation = particle.rotation + particle.rotationSpeed
	end
end

return Particle