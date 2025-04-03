-- Entry point for the game
import "CoreLibs/graphics"
import "CoreLibs/ui"
import "CoreLibs/object"
import "CoreLibs/timer"
import "CoreLibs/animation"

-- Importing libraries
import "scripts/libraries/AnimatedSprite.lua"
import "scripts/libraries/LDtk.lua"

-- Importing scripts
import "scripts/game/gameScene"
import "scripts/game/player"

-- Init game
GameScene()

local pd <const> = playdate
local gfx <const> = playdate.graphics


function pd.update()
-- This function updates the game's sprites and timers every frame.
    gfx.sprite.update()
    pd.timer.updateTimers()
end
