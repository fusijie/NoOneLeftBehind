local GameScene = class("GameScene", function()
    return cc.Scene:createWithPhysics()
end)

function GameScene.createScene(heroCount)
    local scene = GameScene.new()
    scene:getPhysicsWorld():setGravity(cc.p(0, -1000))
    
    local layer = require("GameLayer").new()
    layer:init(heroCount)
    scene:addChild(layer)
    
    return scene
end

return GameScene
