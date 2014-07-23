local HeroController = class("HeroController")

function HeroController.createController(layer, positionY)
    local controller = HeroController.new()
    controller:init(layer, positionY)
    return controller
end

function HeroController:ctor()
	self._layer = nil
	self._positionY = 0
	self._edge = nil
	self._hero = nil
end

function HeroController:init(layer, positionY)
	self._layer = layer
	self._positionY = positionY
	
	local visibleSize = cc.Director:getInstance():getVisibleSize()
	
	-- add edge
	self._edge = require("Edge").new()
    self._layer:addChild(self._edge)
    self._edge:setPosition(visibleSize.width / 2, visibleSize.height / 2 + positionY)
	
    -- add ground
    local ground = cc.Sprite:create()
    ground:setTextureRect(cc.rect(0, 0, visibleSize.width, 3))
    ground:setColor(cc.c3b(0, 0, 0))
    self._layer:addChild(ground)
    ground:setPosition(visibleSize.width / 2, positionY - 3 / 2)
	
    -- add hero
	self._hero = require("Hero").new()
	self._layer:addChild(self._hero)
    self._hero:setPosition(50, positionY + self._hero:getContentSize().height / 2)
	
	self:resetTimer()
end

function HeroController:resetTimer()
	self.frameIndex = 0
	self.nextKeyFrameIndex = math.random(0, 99) + 120
end

function HeroController:onUpdate()
    self.frameIndex = self.frameIndex +1
    if self.frameIndex >= self.nextKeyFrameIndex   then
        local block = require("Block").new()
        block:init()
        self._layer:addChild(block)
        block:setPositionY(self._positionY + block:getContentSize().height / 2)
        self:resetTimer()
    end

end

function HeroController:getEdge()
	return self._edge
end

function HeroController:onTouch()
    if self._hero:getPositionY()<self._positionY+self._hero:getContentSize().height/2+5 then
		self._hero:getPhysicsBody():setVelocity(cc.p(0, 400))
	end
end

return HeroController
