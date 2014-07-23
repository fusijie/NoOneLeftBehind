require("Cocos2d")

local GameScene = class("GameScene", function()
    return cc.LayerColor:create()
end)

function GameScene:ctor()
    self._heroCount = 0
end

function GameScene:init(heroCount)
    self._heroCount = heroCount
    
end

return GameScene
