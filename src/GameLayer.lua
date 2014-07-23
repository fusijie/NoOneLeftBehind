require("Cocos2d")

local GameLayer = class("GameLayer", function()
    return cc.LayerColor:create()
end)

function GameLayer:ctor()
    self._heroCount = 0
    self._controllers = {}
end

function GameLayer:init(heroCount)
    self._heroCount = heroCount
    
    self:addControllers()
    
    function update(dt)
        -- update all hero controllers
        for key, var in pairs(self._controllers) do
        	var:onUpdate()
        end
    end
    
    self:scheduleUpdateWithPriorityLua(update, 0);
end

function GameLayer:addControllers()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    local startY = 30
    local gap = (visibleSize.height - startY) / self._heroCount
    
    for i=1, self._heroCount do
        local controller = require("HeroController").createController(self, startY + gap * i)
        table.insert(self._controllers, i, controller)
    end
end

return GameLayer
