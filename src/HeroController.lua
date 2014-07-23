local HeroController = class("HeroController", cc.Scheduler)

function HeroController.createController(layer, positionY)
    local controller = HeroController.new()
    controller:init(layer, positionY)
    
end

function HeroController:ctor()
	self._layer = nil
	self._positionY = 0
end

function HeroController:init(layer, positionY)
	self._layer = layer
	self._positionY = positionY
	
	-- TODO add edge
	
    -- TODO add ground
	
    -- TODO add hero
	
	resetTimer()
end

function HeroController:resetTimer()
	self.frameIndex = 0
	nextKeyFrameIndex = math.random(0, 99) + 120
end

function HeroController:onUpdate()
-- TODO add block
--            local block = require("Block").new()
--            self._layer:addChild(block)
--            block:setPositionY(self._positionY + block:getContentSize().height / 2)
end

return HeroController
