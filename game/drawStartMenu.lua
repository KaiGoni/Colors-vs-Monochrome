function drawStartMenu()
  love.graphics.setColor(love.math.colorFromBytes(128,0,0,500))
  love.graphics.rectangle("fill", 50, 200, 200, 40)
  love.graphics.setColor(love.math.colorFromBytes(255,255,255,500))
  love.graphics.rectangle("line", 50, 200, 200, 40)
    love.graphics.printf("Play", 50, 200, 200, "center")  
  -- love.graphics.setfont(love.graphics.newfont(20))
end

return drawStartMenu