function drawGrid(mousePos)
  for y = 1, 5 do
    block = 0
    for x = 0, 8 do
      if y % 2 == 0 then
        -- Set color of blocks
        if block == 0 then love.graphics.setColor(love.math.colorFromBytes(34, 139, 34))
        elseif block == 1 then love.graphics.setColor(love.math.colorFromBytes(45, 200, 45))
        elseif block == 2 then love.graphics.setColor(love.math.colorFromBytes(76, 187, 23)) end
        block = block + 1
        if block == 3 then block = 0 end
        
        -- Draw blocks
        love.graphics.polygon("fill", 40+x*2*math.sqrt(1200),40+60*y, 40+math.sqrt(1200)+x*2*math.sqrt(1200),60+60*y, 40+math.sqrt(1200)+x*2*math.sqrt(1200),100+60*y, 40+x*2*math.sqrt(1200),120+60*y, 40-math.sqrt(1200)+x*2*math.sqrt(1200),100+60*y, 40-math.sqrt(1200)+x*2*math.sqrt(1200),60+60*y)
        love.graphics.setColor(love.math.colorFromBytes(255,255,255))
        love.graphics.polygon("line", 40+x*2*math.sqrt(1200),40+60*y, 40+math.sqrt(1200)+x*2*math.sqrt(1200),60+60*y, 40+math.sqrt(1200)+x*2*math.sqrt(1200),100+60*y, 40+x*2*math.sqrt(1200),120+60*y, 40-math.sqrt(1200)+x*2*math.sqrt(1200),100+60*y, 40-math.sqrt(1200)+x*2*math.sqrt(1200),60+60*y)
      else
        -- Set color of blocks
        if block == 0 then love.graphics.setColor(love.math.colorFromBytes(76, 187, 2))
        elseif block == 1 then love.graphics.setColor(love.math.colorFromBytes(34, 139, 34))
        elseif block == 2 then love.graphics.setColor(love.math.colorFromBytes(45, 200, 45)) end
        block = block + 1
        if block == 3 then block = 0 end

        -- Draw blocks
        love.graphics.polygon("fill", 40+math.sqrt(1200)+x*2*math.sqrt(1200),40+60*y, 40+math.sqrt(1200)*2+x*2*math.sqrt(1200),60+60*y, 40+math.sqrt(1200)*2+x*2*math.sqrt(1200),100+60*y, 40+math.sqrt(1200)+x*2*math.sqrt(1200),120+60*y, 40+x*2*math.sqrt(1200),100+60*y, 40+x*2*math.sqrt(1200),60+60*y)
        love.graphics.setColor(love.math.colorFromBytes(255,255,255))
        love.graphics.polygon("line", 40+math.sqrt(1200)+x*2*math.sqrt(1200),40+60*y, 40+math.sqrt(1200)*2+x*2*math.sqrt(1200),60+60*y, 40+math.sqrt(1200)*2+x*2*math.sqrt(1200),100+60*y, 40+math.sqrt(1200)+x*2*math.sqrt(1200),120+60*y, 40+x*2*math.sqrt(1200),100+60*y, 40+x*2*math.sqrt(1200),60+60*y)
      end
    end
  end
  
  -- Draw hovered block
  hovered = getHoveredBlock(mousePos)
  love.graphics.setColor(love.math.colorFromBytes(255,255,255,128))
  if hovered.y % 2 == 0 then
    love.graphics.polygon("fill", 40+(hovered.x-1)*2*math.sqrt(1200),40+60*hovered.y, 40+math.sqrt(1200)+(hovered.x-1)*2*math.sqrt(1200),60+60*hovered.y, 40+math.sqrt(1200)+(hovered.x-1)*2*math.sqrt(1200),100+60*hovered.y, 40+(hovered.x-1)*2*math.sqrt(1200),120+60*hovered.y, 40-math.sqrt(1200)+(hovered.x-1)*2*math.sqrt(1200),100+60*hovered.y, 40-math.sqrt(1200)+(hovered.x-1)*2*math.sqrt(1200),60+60*hovered.y)
  else
    love.graphics.polygon("fill", 40+math.sqrt(1200)+(hovered.x-1)*2*math.sqrt(1200),40+60*hovered.y, 40+math.sqrt(1200)*2+(hovered.x-1)*2*math.sqrt(1200),60+60*hovered.y, 40+math.sqrt(1200)*2+(hovered.x-1)*2*math.sqrt(1200),100+60*hovered.y, 40+math.sqrt(1200)+(hovered.x-1)*2*math.sqrt(1200),120+60*hovered.y, 40+(hovered.x-1)*2*math.sqrt(1200),100+60*hovered.y, 40+(hovered.x-1)*2*math.sqrt(1200),60+60*hovered.y)
  end
end

function getHoveredBlock(mousePos)
  for y = 1, 5 do
    for x = 1, 9 do
      if y % 2 == 0 then
        if mousePos.x > 40-math.sqrt(1200)+(x-1)*2*math.sqrt(1200) and mousePos.x < 40-math.sqrt(1200)+x*2*math.sqrt(1200)
            and mousePos.y > math.abs(mousePos.x-(x-1)*2*math.sqrt(1200)-40)*(20/math.sqrt(1200))+40+y*60
            and mousePos.y < math.abs(mousePos.x-(x-1)*2*math.sqrt(1200)-40)*(-20/math.sqrt(1200))+120+y*60 then
          return {x = x, y = y}
        end
      else
        if mousePos.x > 40+(x-1)*2*math.sqrt(1200) and mousePos.x < 40+x*2*math.sqrt(1200)
            and mousePos.y > math.abs(mousePos.x-(x-1)*2*math.sqrt(1200)-40-math.sqrt(1200))*(20/math.sqrt(1200))+40+y*60
            and mousePos.y < math.abs(mousePos.x-(x-1)*2*math.sqrt(1200)-40-math.sqrt(1200))*(-20/math.sqrt(1200))+120+y*60 then
          return {x = x, y = y}
        end
      end
    end
  end
  return {x = -1, y = -1}
end

return drawGrid