local MenuLayer = class("MenuLayer", function()
    return cc.LayerColor:create(cc.c4b(255,255,255,255))
end)

function MenuLayer:init()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    self:addBtns()
    
    -- add logo
    local logo = cc.Sprite:create("logo.png")
    self:addChild(logo)
    logo:setPosition(50, visibleSize.height - logo:getContentSize().height / 2 - 20)
    
    -- add title
    local title = cc.Sprite:create("title.png")
    self:addChild(title)
    
    title:setPosition(visibleSize.width / 2, visibleSize.height - title:getContentSize().height / 2 - 20)
    
    return true
end

function MenuLayer:addBtns()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    local function menuCallbackOpenNormal()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(2))
    end
    
    local normal = cc.MenuItemImage:create("normal.png", "normal.png")
    normal:setPosition(0, 150)
    normal:registerScriptTapHandler(menuCallbackOpenNormal)
    
    local function menuCallbackOpenNightmare()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(3))
    end
    
    local nightmare = cc.MenuItemImage:create("nightmare.png", "nightmare.png")
    nightmare:setPosition(0, 0)
    nightmare:registerScriptTapHandler(menuCallbackOpenNightmare)
    
    local function menuCallbackOpenHell()
        cc.Director:getInstance():replaceScene(require("GameScene").createScene(4))
    end
    
    local hell = cc.MenuItemImage:create("hell.png", "hell.png")
    hell:setPosition(0, - 150)
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