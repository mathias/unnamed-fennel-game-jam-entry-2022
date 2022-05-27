; (local fennel (require "lib.fennel"))
; (local repl (require "lib.stdio"))
(local lume (require "lume"))

(var current_color [1 1 1 1])

(fn love.load []
                                        ; (repl.start)
  )

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
      (= pressed_key "w")
      (set current_color [1 1 1 1])
      ;; game controls + dev bindings
      (= pressed_key "escape")
      (love.event.quit)
      (= pressed_key "tab")
      (do
        (print "Reloading")
        (lume.hotswap "main")
        (lume.hotswap "game"))))
