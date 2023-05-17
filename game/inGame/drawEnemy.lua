function drawEnemy()
  for i,enemy in ipairs(enemies) do
    if enemy.sprite ~= nil then
      love.graphics.draw(enemy.sprite, enemy.pos, 80+60*enemy.row, 0, 1, 1, 20, 20)
    else
      love.graphics.circle("fill", enemy.pos, 80+60*enemy.row,20)
    end
  end
end

return drawEnemy