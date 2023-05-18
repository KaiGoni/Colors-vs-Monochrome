function drawLoseMenu()
  love.graphics.setColor(love.math.colorFromBytes(30,30,30))
  love.graphics.rectangle("fill", 180, 150, 300, 200)
  love.graphics.setColor(love.math.colorFromBytes(100,100,100))
  love.graphics.rectangle("line", 180, 150, 300, 200)
  love.graphics.printf("YOU LOST", 180, 160, 300, "center")
  love.graphics.setColor(love.math.colorFromBytes(80,80,80))
  love.graphics.rectangle("fill", 220, 280, 100, 40)
  love.graphics.rectangle("fill", 340, 280, 100, 40)
  love.graphics.setColor(love.math.colorFromBytes(160,160,160))
  love.graphics.printf("Play Again", 220, 290, 100, "center")
  love.graphics.printf("Return to \n Main Menu", 340, 285, 100, "center")
end

return drawLoseMenu