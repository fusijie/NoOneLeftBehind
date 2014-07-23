require("Cocos2d")

local GameLayer = class("GameLayer", function()
    return cc.LayerColor:create(cc.c4b(255,255,255,255))
end)

function GameLayer:ctor()
    self._heroCount = 0
    self._controllers = {}
end

function GameLayer:init(heroCount)
    self._heroCount = heroCount
    
    self:addControllers()
    
    local listener = cc.EventListenerTouchOneByOne:create()
    self._listener = listener
    listener:setSwallowTouches(true)
    
    local function onTouchBegan(touch, event)
        for key, controller in pairs(self._controllers) do
            if (cc.rectContainsPoint(controller:getEdge():getBoundingBox(), touch:getLocation())) then
                controller:onTouch()
            end
        end

        return true    
    end

    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN)
    
    function update(dt)
        -- update all hero controllers
        for key, controller in pairs(self._controllers) do
        	controller:onUpdate()
        end
    end
    
    self:scheduleUpdateWithPriorityLua(update, 0);
end

function GameLayer:addControllers()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    local startY = 30
    local gap = (visibleSize.height - startY) / self._heroCount
    
    for i=1, self._heroCount do
        local heroController = require("HeroController")
        local controller = heroController.createController(self, startY + gap * (i - 1))
        self._controllers[i]= controller
    end
end

return GameLayer
