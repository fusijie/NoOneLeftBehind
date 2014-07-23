local Hero = class("Hero", function()
    return cc.Sprite:create()
end)

function Hero:ctor()
    self:init()
end

function Hero:init()
    local width = 44
    local height = 100

    self:setContentSize(width*0.5,height*0.5)

    self:setPhysicsBody(cc.PhysicsBody:createBox(cc.size(width*0.5, height*0.5)))
    
    -- runAction
    local cache = cc.SpriteFrameCache:getInstance()
    -- cache:addSpriteFrames("hero.plist")
    
    local animFrames = {}
    for i = 0, 4 do 
        local frame = cache:getSpriteFrame(string.format("hero_%02d.png", i) )
        animFrames[i] = frame
    end

    local animation = cc.Animation:createWithSpriteFrames(animFrames, 0.1)
    local animate = cc.Animate:create(animation);
    self:runAction(cc.RepeatForever:create(animate))
    
    self:getPhysicsBody():setRotationEnable(false)
    self:getPhysicsBody():setContactTestBitmask(1)

end

return Hero