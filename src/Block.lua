local Block = class("Block", function()
    return cc.Sprite:create()
end)

function Block:init()

	local width = math.random(0, 24) + 5
    local height = math.random(0, 29) + 10
	
	self:setPositionX(cc.Director:getInstance():getVisibleSize().width)
	
    self:setContentSize(width,height)
    self:setTextureRect(cc.rect(0, 0, width, height))
	self:setColor(cc.c3b(0, 0, 0))
	
    self:setPhysicsBody(cc.PhysicsBody:createBox(cc.size(width, height)))
	self:getPhysicsBody():setDynamic(false)
    self:getPhysicsBody():setContactTestBitmask(1)
	
    function update(dt)
		self:setPositionX(self:getPositionX() - 3.5)
		
		if (self:getPositionX() < 0) then
		    self:unscheduleUpdate()
		    
		    self:removeFromParentAndCleanup()
		end
	end
	
	self:scheduleUpdateWithPriorityLua(update, 0)
end

return Block