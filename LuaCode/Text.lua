local love = require("love")
local buttons = require("Button")

function Text(text, box_w, box_h) 
  return{
    text = text or "No text",
    box_x = 0,
    box_y = 0,
    box_w = box_w or 100,
    box_h = box_h or 100,
    
    draw = function(self, box_x, box_y)
      self.box_x = box_x or self.box_x 
      self.box_y = box_y or self.box_y

      self.text_x = box_x + 10
      self.text_y = box_y + 10
      text_limit = box_w - 20

      love.graphics.rectangle("fill", self.box_x, self.box_y, box_w, box_h)
      love.graphics.printf({ {0,0,0}, text}, self.text_x, self.text_y, text_limit, "left")
    end,
  
  button = Button()
  }
end

return Text()
