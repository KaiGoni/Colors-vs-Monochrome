function drawLoseMenu()
  love.graphics.setColor(love.math.colorFromBytes(30,30,30))
  love.graphics.rectangle("fill", 180, 150, 300, 200)
  love.graphics.setColor(love.math.colorFromBytes(100,100,100))
  love.graphics.rectangle("line", 180, 150, 300, 200)
  love.graphics.printf("YOU LOST", 180, 160, 300, "center")
  love.graphics.setColor((mousePos.x > 220 and mousePos.x < 320 and mousePos.y > 280 and mousePos.y < 320) and {love.math.colorFromBytes(120,120,120)} or {love.math.colorFromBytes(80,80,80)})
  love.graphics.rectangle("fill", 220, 280, 100, 40)
  love.graphics.setColor((mousePos.x > 340 and mousePos.x < 440 and mousePos.y > 280 and mousePos.y < 320) and {love.math.colorFromBytes(120,120,120)} or {love.math.colorFromBytes(80,80,80)})
  love.graphics.rectangle("fill", 340, 280, 100, 40)
  love.graphics.setColor(love.math.colorFromBytes(160,160,160))
  love.graphics.printf("Play Again", 220, 290, 100, "center")
  love.graphics.printf("Return to \n Main Menu", 340, 285, 100, "center")
end

return drawLoseMenu