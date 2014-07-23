local MenuLayer = class("MenuLayer", function()
    return cc.LayerColor:create(cc.c4b(255,255,255,255))
end)

function MenuLayer:init()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    self:addBtns()
    
    -- add logo
    local logo = cc.Sprite:create("logo.png")
    self.setScale(logo,1.5)
    self:addChild(logo)
    logo:setPosition(110, visibleSize.height - logo:getContentSize().height / 2 - 90)
    
    -- add split
    local split = cc.Sprite:create("split.png")
    self:addChild(split)
    split:setPosition(175, visibleSize.height - logo:getContentSize().height / 2 - 90)
    
    -- add hero and runAction
    local cache = cc.SpriteFrameCache:getInstance()
    cache:addSpriteFrames("hero.plist")
    
    local hero = cc.Sprite:createWithSpriteFrameName("hero_00.png")
    self:addChild(hero)
    hero:setPosition(295, visibleSize.height - logo:getContentSize().height / 2 - 70)

    local animFrames = {}
    for i = 0, 4 do 
        local frame = cache:getSpriteFrame(string.format("hero_%02d.png", i) )
        animFrames[i] = frame
    end

    local animation = cc.Animation:createWithSpriteFrames(animFrames, 0.1)
    local animate = cc.Animate:create(animation);
    hero:runAction(cc.RepeatForever:create(animate))
    
    -- add title
    local title = cc.Sprite:create("title.png")
    self.setScale(title,0.7)
    self:addChild(title)
    
    title:setPosition(visibleSize.width / 2 + 290, visibleSize.height - title:getContentSize().height / 2 - 120)
    
    return true
end

function MenuLayer:addBtns()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    local function menuCallbackOpenNormal()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(2))
    end
    
    local normal = cc.MenuItemImage:create("normal.png", "normal.png")
    normal:setPosition(0, 120)
    normal:registerScriptTapHandler(menuCallbackOpenNormal)
    
    local function menuCallbackOpenNightmare()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(3))
    end
    
    local nightmare = cc.MenuItemImage:create("nightmare.png", "nightmare.png")
    nightmare:setPosition(0, -20)
    nightmare:registerScriptTapHandler(menuCallbackOpenNightmare)
    
    local function menuCallbackOpenHell()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(4))
    end
    
    local hell = cc.MenuItemImage:create("hell.png", "hell.png")
    hell:setPosition(0, - 160)
    hell:registerScriptTapHandler(menuCallbackOpenHell)
    
    local function menuCallbackOpenInferno()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(5))
    end
    
    local inferno = cc.MenuItemImage:create("inferno.png", "inferno.png")
    inferno:setPosition(0, - 300)
    inferno:registerScriptTapHandler(menuCallbackOpenInferno)
    
    local menu = cc.Menu:create(normal, nightmare, hell, inferno)
    self:addChild(menu)
end

return MenuLayer