function showTowerSelector(towerSelection)
  if towerSelection == "Main" then
    for i, towerType in ipairs(game.towers) do
      love.graphics.setColor(love.math.colorFromBytes(towerType.color))
      love.graphics.rectangle("fill", (i-1)*160+10, 10, 150, 80)
      love.graphics.setColor(love.math.colorFromBytes(255,255,255))
      love.graphics.rectangle("line", (i-1)*160+10, 10, 150, 80)
      love.graphics.draw(towerType.icon, (i-1)*160+10, 10)
    end
  else
    for i, towerType in ipairs(game.towers) do
      love.graphics.setColor(love.math.colorFromBytes(towerType.color))
      if i == towerSelection then
        love.graphics.rectangle("fill", (i-1)*90+10, 10, #towerType.towers*70+90, 80)
        love.graphics.setColor(love.math.colorFromBytes(255,255,255))
        love.graphics.rectangle("line", (i-1)*90+10, 10, #towerType.towers*70+90, 80)
        love.graphics.draw(towerType.icon, (i-1)*90+10, 10)
      elseif i < towerSelection then
        love.graphics.rectangle("fill", (i-1)*90+10, 10, 80, 80)
        love.graphics.setColor(love.math.colorFromBytes(255,255,255))
        love.graphics.rectangle("line", (i-1)*90+10, 10, 80, 80)
        love.graphics.draw(towerType.icon, (i-1)*90+10, 10)
      else
        love.graphics.rectangle("fill", (i-1)*90+#game.towers[towerSelection].towers*70+20, 10, 80, 80)
        love.graphics.setColor(love.math.colorFromBytes(255,255,255))
        love.graphics.rectangle("line", (i-1)*90+#game.towers[towerSelection].towers*70+20, 10, 80, 80)
        love.graphics.draw(towerType.icon, (i-1)*90+#game.towers[towerSelection].towers*70+20, 10)
      end
      if i == towerSelection then
        love.graphics.setColor(love.math.colorFromBytes(160,160,160))
        if selectedTower.name ~= "" then
          love.graphics.rectangle("fill",selectedTower.pos,20,60,60)
        end
        for j,tower in ipairs(towerType.towers) do
          if tower.icon then
            love.graphics.draw(tower.icon, (i-1)*90+j*70+30, 20)
          else
            love.graphics.draw(nullTexture, (i-1)*90+j*70+40, 30,0,2,2)
          end
        end
      end
    end
  end
end

return showTowerSelector