function love.keypressed(key, scancode, isrepeat)
  if key == "f3" then
    debug.enabled = not debug.enabled
  end
end

function love.load()
  -- Define game functions
  game = require("util/game")
  waves = require("util/waves")
  debug = {["enabled"] = false, ["windowPos"] = {["x"] = 0, ["y"] = 0}, ["dragging"] = {["active"] = false, ["dx"] = 0, ["dy"] = 0}}
  showDebugMenu = true
  previousDebugPos = {}
  math.randomseed(os.time())
  inGame = false
  menu = "start"
  paused = true
  time = 0
  wave = 0
  selectedTower = {["id"] = "", ["name"] = "", ["sprite"] = "", ["health"] = 0, ["attackSpeed"] = 0, ["pos"] = 0}
  startGame = require("game/menus/startGame")
  drawStartMenu = require("game/menus/drawStartMenu")
  drawLoseMenu = require("game/menus/drawLoseMenu")
  drawWinMenu = require("game/menus/drawWinMenu")
  love.filesystem.load("game/inGame/eventListeners.lua")()
  drawGrid = require("game/inGame/drawGrid")
  showTowerSelector = require("game/inGame/towerSelector")
  drawTowers = require("game/inGame/drawTowers")
  drawProjectile = require("game/inGame/drawProjectile")
  spawnEnemy = require("game/inGame/spawnEnemy")
  drawEnemy = require("game/inGame/drawEnemy")
  towerActions = require("game/inGame/towerActions")
  moveProjectile = require("game/inGame/moveProjectile")
  mousePos = {["x"] = 0, ["y"] = 0}
  hovered = {["x"] = -1, ["y"] = -1}
  nullTexture = love.graphics.newImage("assets/textures/gui/null.png")
end

function love.update(dt)
  mousePos.x, mousePos.y = love.mouse.getPosition()
  if debug.dragging.active then
    debug.windowPos.x = love.mouse.getX() - debug.dragging.dx
    debug.windowPos.y = love.mouse.getY() - debug.dragging.dy
  end
  if debug.windowPos.x < 0 then
    debug.windowPos.x = 0
  elseif debug.windowPos.x > love.graphics.getWidth() - 300 then
    debug.windowPos.x = love.graphics.getWidth() - 300
  end
  if debug.windowPos.y < 0 then
    debug.windowPos.y = 0
  elseif debug.windowPos.y > love.graphics.getHeight() - 120 then
    debug.windowPos.y = love.graphics.getHeight() - 120
  end

  if inGame and paused == false then
    time = time + dt
    spawnEnemy(dt < 1/60 and dt or 1/60)
    towerActions(dt < 1/60 and dt or 1/60)
    moveProjectile(dt < 1/60 and dt or 1/60)
  end
end

function love.draw()
  if inGame then
    drawGrid(mousePos)
    showTowerSelector(towerSelection)
    drawTowers(towers)
    drawEnemy()
    drawProjectile()
  end
  if menu == "start" then
    drawStartMenu()
  elseif menu == "lose" then
    drawLoseMenu()
  elseif menu == "win" then
    drawWinMenu()
  end
  if debug.enabled then -- Debug Menu
    love.graphics.setColor(love.math.colorFromBytes(50,50,50))
    love.graphics.rectangle("fill", debug.windowPos.x, debug.windowPos.y, 300, 20)
    love.graphics.setColor(love.math.colorFromBytes(200,0,0))
    love.graphics.print("Debug Menu", debug.windowPos.x + 3, debug.windowPos.y+3)
    if showDebugMenu then
      love.graphics.setColor(love.math.colorFromBytes(30,30,30,200))
      love.graphics.rectangle("fill", debug.windowPos.x, debug.windowPos.y+20, 300, 100) --starts showing debug info here
      love.graphics.setColor(love.math.colorFromBytes(128,128,128))
      love.graphics.print("FPS: "..love.timer.getFPS(), debug.windowPos.x, debug.windowPos.y+20)
      love.graphics.print("Time: "..time, debug.windowPos.x, debug.windowPos.y+30)
      love.graphics.print("Wave: "..wave, debug.windowPos.x, debug.windowPos.y+40)
      love.graphics.print("MousePos: "..mousePos.x..", "..mousePos.y, debug.windowPos.x, debug.windowPos.y+50)
      love.graphics.print(hovered.x ~= -1 and "BlockHovered:"..hovered.x..", "..hovered.y or "", debug.windowPos.x, debug.windowPos.y+60)
      -- right side
      love.graphics.printf("SelectedTower: "..(selectedTower.id ~= "" and selectedTower.id or "None"), debug.windowPos.x, debug.windowPos.y+20, 300, "right")
      love.graphics.printf(selectedTower.id ~= "" and "Type: "..game.towers[towerSelection].id or "", debug.windowPos.x, debug.windowPos.y+30, 300, "right")
      love.graphics.printf(hovered.x ~= -1 and (gameGrid[hovered.x][hovered.y].towerID ~= nil and "TowerHovered: "..gameGrid[hovered.x][hovered.y].towerID or "") or "", debug.windowPos.x, selectedTower.id ~= "" and debug.windowPos.y+50 or debug.windowPos.y+40, 300, "right")
      love.graphics.printf(hovered.x ~= -1 and (gameGrid[hovered.x][hovered.y].towerID ~= nil and "TowerHealth: "..gameGrid[hovered.x][hovered.y].health or "") or "", debug.windowPos.x, selectedTower.id ~= "" and debug.windowPos.y+60 or debug.windowPos.y+50, 300, "right")
    end
  end
end