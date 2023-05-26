function love.mousepressed(x, y)
  if mousePos.x < 20 and mousePos.y < 20 then
    debug.enabled = not debug.enabled
  end
  if debug.enabled and x > debug.windowPos.x and x < debug.windowPos.x + 300 and y > debug.windowPos.y and y <
    debug.windowPos.y + 20 then -- Drag debug window
    previousDebugPos = {["x"] = debug.windowPos.x, ["y"] = debug.windowPos.y}
    debug.dragging.active = true
    debug.dragging.dx = x - debug.windowPos.x
    debug.dragging.dy = y - debug.windowPos.y
  elseif inGame and menu == "game" then -- If did not drag debug menu while game active
    if y > 10 and y < 90 then -- Selecting tower type
      local currentTowerType = towerSelection
      for i, towerType in ipairs(game.towers) do -- Check if mouse is in a tower type's hitbox
        if x > towerType.guiHitbox[1] and x < towerType.guiHitbox[2] then
          towerSelection = i
        end
      end
      if currentTowerType ~= towerSelection then -- Change tower type
        selectedTower.name = ""
        selectedTower.id = ""
        if towerSelection ~= "Main" then
          for i, towerType in ipairs(game.towers) do
            if i == towerSelection then
              game.towers[i].guiHitbox = {(i - 1) * 90 + 10, (i - 1) * 90 + #towerType.towers * 70 + 100}
            elseif i < towerSelection then
              game.towers[i].guiHitbox = {(i - 1) * 90 + 10, i * 90}
            else
              game.towers[i].guiHitbox = {(i - 1) * 90 + #game.towers[towerSelection].towers * 70 + 20,i * 90 + #game.towers[towerSelection].towers * 70}
            end
          end
        end
      else
        if towerSelection ~= "Main" then
          local chosenTower = true
          if y > 20 and y < 80 then
            for i, tower in ipairs(game.towers[towerSelection].towers) do
              if x > towerSelection * 90 + (i - 1) * 70 + 10 and x < towerSelection * 90 + i * 70 then
                if game.towerList[tower.id].count > 0 then
                selectedTower.id, selectedTower.name, selectedTower.sprite, selectedTower.health, selectedTower.attackSpeed =
                  tower.id,       tower.name,         tower.sprite,         tower.health,         tower.attackSpeed ~= nil and tower.attackSpeed or .5
                selectedTower.pos = towerSelection * 90 + (i - 1) * 70 + 10
                end
                chosenTower = false
              end
            end
          end
          if x > game.towers[towerSelection].guiHitbox[1] and x < game.towers[towerSelection].guiHitbox[2] and chosenTower then
            selectedTower.name = ""
            selectedTower.id = ""
            towerSelection = "Main"
            for i in ipairs(game.towers) do
              game.towers[i].guiHitbox = {i * 160 - 150, i * 160}
            end
          end
        end
      end
    end
    if selectedTower.name ~= "" then -- Place tower
      if hovered.x ~= -1 and hovered.y ~= -1 then
        if gameGrid[hovered.x][hovered.y].towerID == nil then
          game.towerList[selectedTower.id].count = game.towerList[selectedTower.id].count - 1
          gameGrid[hovered.x][hovered.y].towerID, gameGrid[hovered.x][hovered.y].sprite, gameGrid[hovered.x][hovered.y].health, gameGrid[hovered.x][hovered.y].attackCooldown =
          selectedTower.id,                       selectedTower.sprite,                  selectedTower.health,                  selectedTower.attackSpeed ~= nil and .5 or nil
          if game.towerList[selectedTower.id].count <= 0 then
            selectedTower.name = ""
            selectedTower.id = ""
          end
        end
      end
    end
  elseif menu == "start" then -- Did not drag debug menu in start menu
    if x > 100 and x < 300 and y > 300 and y < 340 then
      startGame()
    end
  elseif menu == "lose" then -- Did not drag debug menu in lose menu
    if x > 220 and x < 320 and y > 280 and y < 320 then
      startGame()
    elseif x > 340 and x < 440 and y > 280 and y < 320 then
      inGame = false
      menu = "start"
    end
  elseif menu == "win" then -- Did not drag debug menu in win menu
    if x > 220 and x < 320 and y > 280 and y < 320 then
      inGame = false
      menu = "start"
    elseif x > 340 and x < 440 and y > 280 and y < 320 then
      -- TODO: infinite mode
      wave = "Endless"
      timeTillNextEnemy = 10
      deltaSummonTime = 10
      slimeChance = 1
      clayChance = 0
      paused = false
      menu = "game"
    end
  end
end

function love.mousereleased(x, y, button)
  if button == 1 then
    if previousDebugPos.x == debug.windowPos.x and previousDebugPos.y == debug.windowPos.y and debug.dragging.active then
      showDebugMenu = not showDebugMenu
    end
    debug.dragging.active = false
  end
end