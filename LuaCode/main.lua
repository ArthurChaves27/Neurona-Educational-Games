love = require("love")
textbox = require("Text")
button = require("Button")

function love.load()
  background = love.graphics.newImage('Sprite/Corredormassa.jpeg')

  --Setando sprite do personagem
  carinha = {
    x = 1000,
    y = 456,
    sprite = love.graphics.newImage("Sprite/AndandoPt3.png"),
    animation = {
      direction = "left",
      idle = true,
      frame = 1,
      max_frame = 8,
      speed = 20,
      timer = 0.1
    }
  }

  --Tamanhos do Sprite e Separacao dos quadros da animacao
  SpriteW, SpriteH = 1280, 320
  QuadW = 160
  QuadH = SpriteH
  quads = {}
  --Cria os quadros dentro do sprite
  for i = 1, 8 do
   quads[i] = love.graphics.newQuad(QuadW * (i - 1), 0, QuadW, QuadH, SpriteW, SpriteH) 
  end

  texts = {

  }

  buttons = {

  }

  texts.pergunta = Text("Quanto e doys maiz dooys?", 200, 100)
  buttons.respostaA = Button("Zincu", nil, nil, 60, 30)
  buttons.respostaB = Button("Cuadro", nil, nil, 60, 30)
end



function love.update(dt)
  --Setando Movimento
  if love.keyboard.isDown("a") then
    carinha.animation.idle = false
    carinha.animation.direction = "left"
  elseif love.keyboard.isDown("d") then
    carinha.animation.idle = false
    carinha.animation.direction = "right"
  else
    carinha.animation.idle = true
    carinha.animation.frame = 1
  end
  
  --Se nn for idle
  if not carinha.animation.idle then  
    --Atualiza o timer de acordo com o tempo
    carinha.animation.timer = carinha.animation.timer + dt
    --Altera os frames quando o timer chega em um certo tempo
    if carinha.animation.timer > 0.17 then
      carinha.animation.timer = 0.1
      
      carinha.animation.frame =  carinha.animation.frame + 1

      if carinha.animation.direction == "left" then
        carinha.x = carinha.x - carinha.animation.speed
      elseif carinha.animation.direction == "right" then
         carinha.x = carinha.x + carinha.animation.speed
      end
    
      if  carinha.animation.frame >  carinha.animation.max_frame then
         carinha.animation.frame = 1
      end
    end
  end
end
  
function love.draw()
  --love.graphics.scale(0.5)
  love.graphics.draw(background)

  love.graphics.printf("FPS: " .. love.timer.getFPS(), 10, 10, love.graphics.getWidth())

      love.graphics.scale(0.8)
      if carinha.animation.direction == "right" then
         love.graphics.draw(carinha.sprite, quads[carinha.animation.frame], carinha.x, carinha.y)
      else
        love.graphics.draw(carinha.sprite, quads[carinha.animation.frame], carinha.x, carinha.y, 0, -1, 1, QuadW, 0)
      end

  texts.pergunta:draw(400, 200)
  buttons.respostaA:draw(425, 250, 10, 5)
  buttons.respostaB:draw(515, 250, 10, 5)
 end
