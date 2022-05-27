; (local fennel (require "lib.fennel"))
; (local repl (require "lib.stdio"))

(var current_color [1 1 1 1])

(fn love.draw []
  (local square [100 100 100 200 200 200 200 100])
  (love.graphics.setColor current_color)
  (love.graphics.polygon "fill" square)
)

(fn love.keypressed [pressed_key]
  (if (= pressed_key "b")
      (set current_color [0 0 1 1])
      (= pressed_key "g")
      (set current_color [0 1 0 1])
      (= pressed_key "r")
      (set current_color [1 0 0 1])
      (set current_color [1 1 1 1])
      ))
