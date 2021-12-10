function construct_button(x, y, width, height, r, g, b, custom_func)
    local button = {}
    button.x = x
    button.y = y
    button.r = r
    button.g = g
    button.b = b
    button.width = width
    button.height = height
    button.onpress = custom_func
    
    button.draw = function()
        love.graphics.setColor(r / 255.0, g / 255.0, b / 255.0)
        love.graphics.rectangle('fill', button.x, button.y, button.width, button.height)
        love.graphics.print('button', button.x + button.width/2, button.y + button.y/2)
    end
    return button
end