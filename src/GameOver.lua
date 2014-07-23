require("Cocos2d")

local GameOver = class("GameOver", function()
    return cc.LayerColor:create()
end)

function GameOver.create(currentHeroCount,score)
	_ins = GameOver.new()
	_ins:initWithCurrentHeroCountAndScore(currentHeroCount,score)
    _ins:autorelease()
    return _ins
end

function GameOver.createScene(currentHeroCount,score)
	scene = cc.Scene:create()
	layer = GameOver.create(currentHeroCount)
    scene:addChild(layer)
    return scene
end

function GameOver:createButton(text,fontSize)
    l = cc.Label:create()
    l:setString(text)
    l:setColor({0,0,0})
    l:setSystemFontSize(fontSize)
    return l
end

function GameOver:initWithCurrentHeroCountAndScore(currentHeroCount,score)
    cc.LayerColor:initWithColor({255, 255, 255, 255})
    self._currentHeroCount = currentHeroCount
    self._score = score
    label = cc.Label:create()
    label:setString("游戏结束")
    label:setColor({0, 0, 0})
    label:setSystemFontSize(40)
    self:addChild(label)
    visibleSize = cc.Director:getInstance():getVisibleSize()
    label:setPosition(visibleSize.width/2,visibleSize.height-label:getContentSize().height/2-80)
    
    btnReplay = self:createButton("再来一次",32)
    btnReplay:setPosition(visibleSize.width/2, label:getPositionY()-label:getContentSize().height/2-150)
    self:addChild(btnReplay)
    
    --add gohome btn
    btnGoHome = createButton("回主页", 32)
    btnGoHome:setPosition(visibleSize.width/2, btnReplay:getPositionY()-btnReplay:getContentSize().height/2-50)
    addChild(btnGoHome)
    
    --add logo
    logo = cc.Sprite:create("logo.png")
    addChild(logo)
    logo:setPosition(visibleSize.width/2,20)
    logo:setAnchorPoint({0.5,0})
    
    local touchListener=nil
    local function onTouchBegan(touch, event)
        if btnGoHome:getBoundingBox():containsPoint(touch:getLocation()) then
        	cc.Director:getInstance():getEventDispatcher():removeEventListener(touchListener)
            local StartUp = require("MenuScene")
            cc.Director:getInstance():replaceScene(StartUp.createScene())
        elseif btnReplay:getBoundingBox():containsPoint(touch:getLocation()) then
            local GameScene = require("GameScene")
            cc.Director:getInstance():getEventDispatcher():removeEventListener(touchListener)
            cc.Director:getInstance():replaceScene(GameScene.createScene(self._currentHeroCount))
        
        end
        return false
    end
    touchListener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(touchListener, self)
end

return GameOver

