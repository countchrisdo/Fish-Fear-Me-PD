local pd <const> = playdate
local gfx <const> = pd.graphics
local ldtk <const> = LDtk

TAGS = {
    PLAYER = 1,
    ENEMY = 2,
    PROJECTILE = 3,
    WALL = 4
}

Z_INDEXES = {
    UI = 9999,
    PLAYER = 100,
    ENEMY = 90
}

class('GameScene').extends()
function GameScene:init()
    -- Initialize the game scene
    self.spawnX = 12 * 16
    self.spawnY = 5 * 16
    -- (12, 5) are grid coordinates. 16 is the tile sizes to get the pixel coordinates.
    self.player = Player(self.spawnX, self.spawnY, self)
    -- self.camera = nil
    self.enemies = {}
    self.gameOver = false

end