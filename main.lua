-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local tapCount = 0

local background = display.newImageRect( "espaco.jpg", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )

local platform = display.newImageRect( "platform.png", 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local et = display.newImageRect( "et.png", 112, 112)
et.x = display.contentCenterX
et.y = display.contentCenterY
et.alpha = 0.8

local physics = require("physics")
physics.start()

physics.addBody(platform, "static")
physics.addBody(et, 'dynamic', {radius = 50, bounce = 0.3 })

local function pushEt()
    et:applyLinearImpulse(0, -0.75, et.x, et.y )
    tapCount = tapCount + 1
    tapText.text = tapCount
end

et:addEventListener( "tap", pushEt )