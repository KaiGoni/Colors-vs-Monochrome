function drawStartMenu()
  love.graphics.setColor(love.math.colorFromBytes(128,0,0))
  love.graphics.rectangle("fill", 100, 300, 200, 40)
  love.graphics.setColor(love.math.colorFromBytes(255,255,255))
  love.graphics.rectangle("line", 100, 300, 200, 40)
  love.graphics.printf("Play", 100, 310, 200, "center")  
  -- love.graphics.setfont(love.graphics.newfont(20))
end

return drawStartMenu