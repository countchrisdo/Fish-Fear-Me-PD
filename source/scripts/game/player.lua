local pd = playdate
local gfx = pd.graphics

class('Player').extends(AnimatedSprite)
-- AnimatedSprite library implements a state machine for sprites
-- A state machine is a way to organize code that changes the behavior of an object 

function Player:init(x,y, gameManager)
    -- init() method: inits objects
    -- ARGS: x, y are the pixel coordinates of the player / gameManager is the game manager object
        -- Storing Game manager as property
        self.gameManager = gameManager
        local playerImageTable = gfx.imagetable.new("images/gup-table-16-16")
        -- local playerImageTable = gfx.imagetable.new("images/gup-table-16-16")
        Player.super.init(self, playerImageTable) -- super.init calls init method of parent class (AnimatedSprite)

        self:addState("idle", 1, 1)
        self:addState("walk", 1, 3, {tickStep = 4})
        self:playAnimation()

        self:moveTo(x, y)
        self.moveSpeed = 1
        self.projectileSpeed = 1
        self:setZIndex(Z_INDEXES.PLAYER)
        self:setTag(TAGS.PLAYER)
        self:setCollideRect(3, 3, 10, 13) -- Standard Playdate SDK collision method
end

function Player:shoot()
        -- function is not finished
    -- shoot() method: shoots a bullet
    -- ARGS: none
    local projectileInstance = Projectile(x, y-10, self.projectileSpeed)
    projectileInstance:add()

end

function Player:fish()
    -- function is not finished
    -- fish() method: fishes
    -- ARGS: none
    -- Calls the fish method of the game manager
    self.gameManager:fish()
end

function Player:move()
    -- move() method: moves the player
    -- ARGS: none
    -- Movement
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self:moveBy(-self.moveSpeed, 0)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        self:moveBy(self.moveSpeed, 0)
    end
    
end

function Player:update()
    -- update() method: updates the player sprite
    -- ARGS: none
    -- Calls the update method of the parent class (AnimatedSprite)
    self:updateAnimation()
    self:move()
end