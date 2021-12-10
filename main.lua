local sprite_location = 'assets/sprites/'
require('buttons')

function construct_cards(filepath)
    return love.graphics.newImage(filepath, { dpiscale = 8 })
end

function love.load()
    poker_table = love.graphics.newImage(sprite_location .. 'poker_table_2.jpg', {
        dpiscale = 0.6
    })

    card_back = construct_cards(sprite_location .. 'blue_back.png')
    deck = {}
    numbers = {'A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'}
    suites = {'S', 'H', 'D', 'C'}
    
    for idx, n in ipairs(numbers) do
        for _, s in ipairs(suites) do
            if idx > 10 then
                idx = 10
            end
            table.insert(deck, {
                card_value = idx,
                card_face = construct_cards(sprite_location .. n .. s .. '.png')
            })
        end
    end
    
    
    btn = construct_button(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 231, 210, 204, 200, 200, function()
        print('button pressed!')
    end)
end

function love.update(dt)

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.draw(poker_table)
    love.graphics.push()
    love.graphics.translate(love.graphics.getWidth() / 2 - card_back:getWidth(), love.graphics.getHeight() / 2 - card_back:getHeight() / 2)
    love.graphics.draw(card_back, -200, 0)
    love.graphics.pop()
    
    btn.draw()
end