local Hero = class("Hero", function()
    return cc.Sprite:create()
end)

function Hero:init()
    getmetatable(self):init()

    local width = 44
    local height = 52

    self:setContentSize(width*0.5,height*0.5)

    self:setPhysicsBody(cc.PhysicsBody:createBox(cc.size(width*0.5, height*0.5)))
    
    self:setScale(0.5)
    
    -- runAction
    
    self:getPhysicsBody():setRotationEnable(false)
    self:getPhysicsBody():setContactTestBitmask(1)

end

return Hero