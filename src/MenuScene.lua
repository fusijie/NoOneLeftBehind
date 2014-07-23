require "Cocos2d"
require "Cocos2dConstants"

local MenuScene = class("MenuScene",function()
    return cc.Scene:create()
end)

function MenuScene.createScene()
    local scene = MenuScene.new()
    local layer = require("MenuLayer").new()
    layer:init()
    scene:addChild(layer)
    return scene
end

return MenuScene
