local pd = playdate
local gfx = pd.graphics

class('Hud').extends(gfx.sprite)
-- Hud class: handles the HUD (heads-up display) of the game
-- inherits from the gfx.sprite class
-- is used to display the player's score, health, and other information

function Hud:init()
    self.backgroundImage = gfx.image.new("images/background1")
    -- Calculate the center position
    local screenWidth, screenHeight = 400, 240
    local imageWidth, imageHeight = 0, 0

    if self.backgroundImage then
        imageWidth, imageHeight = self.backgroundImage:getSize()
    else
        error("Failed to load background image: images/background1")
    end
    self:setImage(self.backgroundImage)
    self:moveTo(screenWidth / 2, screenHeight / 2) -- Move the HUD bg to center

    -- Rendering text 
    gfx.pushContext(self.backgroundImage)
        gfx.setColor(gfx.kColorBlack)
        gfx.fillRect(0, 215, 400, 25) -- GUI Box
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        gfx.drawText("Fish Fear Me: PD", 8, 220)
    gfx.popContext()
    
    self:setImage(self.backgroundImage) -- Update the sprite with the modified image
    self:add() -- Add the sprite to the display
end

function Hud:update()
    -- update() method: updates the HUD
    -- ARGS: none
    if pd.isCrankDocked() then
        pd.ui.crankIndicator:draw(64, 64)
    end
end