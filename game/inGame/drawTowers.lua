function drawTowers(towers)
  love.graphics.setColor(love.math.colorFromBytes(255,255,255))
  for x=1,9 do
    for y=1,5 do
      if y % 2 == 0 then
        if gameGrid[x][y].sprite ~= nil then
          love.graphics.draw(gameGrid[x][y].sprite, 20+(x-1)*2*math.sqrt(1200), 60+y*60)
        elseif gameGrid[x][y].towerID ~= nil then
          love.graphics.draw(nullTexture, 20+(x-1)*2*math.sqrt(1200), 60+y*60,0,2,2)
        end
      elseif gameGrid[x][y].towerID ~= nil then
        if gameGrid[x][y].sprite ~= nil then
          love.graphics.draw(gameGrid[x][y].sprite, 20+math.sqrt(1200)+(x-1)*2*math.sqrt(1200), 60+y*60)
        else
          love.graphics.draw(nullTexture, 20+math.sqrt(1200)+(x-1)*2*math.sqrt(1200), 60+y*60,0,2,2)
        end
      end
    end
  end
end

return drawTowers