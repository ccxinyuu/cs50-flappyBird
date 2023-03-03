ScoreState = Class{__includes = BaseState}

local gold = love.graphics.newImage('gold.png')
local silver = love.graphics.newImage('silver.png')
local bronze = love.graphics.newImage('bronze.png')


function ScoreState:update(dt)
    -- body
    if pause == false then
        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            gStateMachine:change('countdown')
        end
    end
end

function ScoreState:enter(params)
    -- body
    self.score = params.score

    if self.score >= 5 then
        medal = 1
    elseif self.score >= 3 then
        medal = 2
    elseif self.score >= 1 then
        medal = 3
    else
        medal = 0
    end
end

function ScoreState:render()
    -- body
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You Lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if medal == 1 then
        love.graphics.draw(gold, 5, 5)
        love.graphics.printf('You won : Gold Trophy!', 10, 10, gold:getWidth(), 'center')
    elseif medal == 2 then
        love.graphics.draw(silver, 5, 5)
        love.graphics.printf('You won : Silver Trophy!', 10, 10, silver:getWidth(), 'center')
    elseif medal == 3 then
        love.graphics.draw(bronze, 5, 5)
        love.graphics.printf('You won : Bronze Trophy!', 10, 10, bronze:getWidth(), 'center')
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end