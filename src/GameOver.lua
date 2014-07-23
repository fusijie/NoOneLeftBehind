require("Cocos2d")

local GameOver = class("GameOver", function()
    return cc.LayerColor:create(cc.c4b(255,255,255,255))
end)

function GameOver.create(currentHeroCount,score)
    local scene = cc.Scene:create()
	local layer = GameOver.new()
    layer:initWithCurrentHeroCountAndScore(currentHeroCount,score)
    
    scene:addChild(layer)
	
    return scene
end

function GameOver.createScene(currentHeroCount,score)
	local scene = cc.Scene:create()
	local layer = GameOver.create(currentHeroCount, score)
    scene:addChild(layer)
    return scene
end

function GameOver:initWithCurrentHeroCountAndScore(currentHeroCount,score)
    self._currentHeroCount = currentHeroCount
    self._score = score
    
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    local scoreLabel = cc.Label:createWithTTF("","fonts/Marker Felt.ttf", 32)
    scoreLabel:setColor(cc.c3b(0, 0, 0))
    scoreLabel:setString(string.sub(score,1,4))
    self:addChild(scoreLabel)
    scoreLabel:setPosition(visibleSize.width / 2, visibleSize.height - 30)
    
    local logo = cc.Sprite:create("logo.png")
    logo:setScale(1.3)
    self:addChild(logo)
    logo:setPosition(visibleSize.width / 2, visibleSize.height - logo:getContentSize().height / 2 - 120)
    
    local gameOver = cc.Sprite:create("game_over.png")
    gameOver:setScale(0.8)
    self:addChild(gameOver)
    gameOver:setPosition(visibleSize.width / 2, visibleSize.height - logo:getContentSize().height / 2 - 210)
    
    local function menuCallbackRestart()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(self._currentHeroCount))
    end

    local restart = cc.MenuItemImage:create("restart.png", "restart.png")
    restart:setPosition(0, 30)
    restart:registerScriptTapHandler(menuCallbackRestart)

    local function menuCallbackMainMenu()
        cc.Director:getInstance():replaceScene(require("MenuScene").createScene())
    end

    local mainMenu = cc.MenuItemImage:create("main_menu.png", "main_menu.png")
    mainMenu:setPosition(0, -120)
    mainMenu:registerScriptTapHandler(menuCallbackMainMenu)
    
    local menu = cc.Menu:create(restart, mainMenu)
    self:addChild(menu)
end

return GameOver

