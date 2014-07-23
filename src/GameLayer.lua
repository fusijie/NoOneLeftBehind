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
    
    self.touchListener = cc.EventListenerTouchOneByOne:create()
    self.touchListener:setSwallowTouches(true)
    
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local score = 0
    
    local scoreLabel = cc.Label:create()
    scoreLabel:setColor(cc.c3b(0, 0, 0))
    scoreLabel:setSystemFontSize(24)
    scoreLabel:setString(score)
    self:addChild(scoreLabel)
    scoreLabel:setPosition(visibleSize.width / 2, visibleSize.height - 20)
    
    local function onTouchBegan(touch, event)
        for key, controller in pairs(self._controllers) do
            xx = controller:getEdge():getBoundingBox()
            if (cc.rectContainsPoint(xx, touch:getLocation())) then
                controller:onTouch()
                break
            end
        end

        return true
    end

    self.touchListener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN)
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(self.touchListener, self)
    
    local function onContactBegin(contact)
        self:unscheduleUpdate()
        
        cc.Director:getInstance():getEventDispatcher():removeEventListener(self.touchListener)
        cc.Director:getInstance():getEventDispatcher():removeEventListener(self.contactListener)
        
        cc.Director:getInstance():replaceScene(require("GameOver").create(self._heroCount, score))
    end
    
    self.contactListener = cc.EventListenerPhysicsContact:create();
    self.contactListener:registerScriptHandler(onContactBegin, cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN);
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(self.contactListener, self);
    
    function update(dt)
        score = score + dt
        
        scoreLabel:setString(string.sub(score, 1, 4))
        
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
        table.insert(self._controllers,0,controller)
    end
end

return GameLayer
