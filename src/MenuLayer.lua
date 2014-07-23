local MenuLayer = class("MenuLayer", function()
	return cc.LayerColor:create()
end)

function MenuLayer:ctor() 
    self.btnTwo = nil
    self.btnThree = nil
    self.btnFour = nil
    self.btnFive = nil
end

function MenuLayer:init()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    self:addBtns()
    self:addBtnListeners()
    
    -- add logo
    local logo = cc.Sprite:create("logo.png")
    self:addChild(logo)
    
    logo:setPosition(visibleSize.width / 2, 20)
    logo:setAnchorPoint(0.5, 0)
    
    -- add title
    local titleLabel = cc.Label:create()
    self:addChild(titleLabel)
    
    titleLabel:setSystemFontSize(40)
    titleLabel:setString("一个都不能死")
    titleLabel:setColor(cc.c3b(255, 255, 255))
    titleLabel:setPosition(visibleSize.width / 2, visibleSize.height - titleLabel:getContentSize().height / 2 - 20)
    
    return true
end

function MenuLayer:addBtns()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    
    self.btnTwo = cc.Label:create()
    self.btnTwo:setSystemFontSize(32)
    self.btnTwo:setColor(cc.c3b(255, 255, 255))
    self.btnTwo:setString("两个")
    self.btnTwo:setPosition(visibleSize.width / 2, visibleSize.height / 2 + 75)
    self:addChild(self.btnTwo)
    
    self.btnThree = cc.Label:create()
    self.btnThree:setSystemFontSize(32)
    self.btnThree:setColor(cc.c3b(255, 255, 255))
    self.btnThree:setString("三个")
    self.btnThree:setPosition(visibleSize.width / 2, visibleSize.height / 2 + 25)
    self:addChild(self.btnThree)
    
    self.btnFour = cc.Label:create()
    self.btnFour:setSystemFontSize(32)
    self.btnFour:setColor(cc.c3b(255, 255, 255))
    self.btnFour:setString("四个")
    self.btnFour:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 25)
    self:addChild(self.btnFour)
    
    self.btnFive = cc.Label:create()
    self.btnFive:setSystemFontSize(32)
    self.btnFive:setColor(cc.c3b(255, 255, 255))
    self.btnFive:setString("五个")
    self.btnFive:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 75)
    self:addChild(self.btnFive)
end

function MenuLayer:addBtnListeners()
	
end

return MenuLayer