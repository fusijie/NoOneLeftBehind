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
    -- self.setScale(logo,1.5)
    self:addChild(split)
    split:setPosition(175, visibleSize.height - logo:getContentSize().height / 2 - 90)
    
    -- add title
    local title = cc.Sprite:create("title.png")
    self.setScale(title,0.7)
    self:addChild(title)
    
    title:setPosition(visibleSize.width / 2 + 60, visibleSize.height - title:getContentSize().height / 2 - 120)
    
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
    	
    end
    
    local nightmare = cc.MenuItemImage:create("nightmare.png", "nightmare.png")
    nightmare:setPosition(0, -20)
    nightmare:registerScriptTapHandler(menuCallbackOpenNightmare)
    
    local function menuCallbackOpenHell()

    end
    
    local hell = cc.MenuItemImage:create("hell.png", "hell.png")
    hell:setPosition(0, - 160)
    hell:registerScriptTapHandler(menuCallbackOpenHell)
    
    local function menuCallbackOpenInferno()

    end
    
    local inferno = cc.MenuItemImage:create("inferno.png", "inferno.png")
    inferno:setPosition(0, - 300)
    inferno:registerScriptTapHandler(menuCallbackOpenInferno)
    
    local menu = cc.Menu:create(normal, nightmare, hell, inferno)
    self:addChild(menu)
end

return MenuLayer