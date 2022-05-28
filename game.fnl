(local fennel (require "fennel"))
(local lume (require "lume"))
(local util (require "util"))

(var current_color [1 1 1 1])

(fn love.load []
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

;; Genes encoding/decoding
(local genes "01234abcdeFGHI56789ABCDE")
(local bs ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P"
           "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "a" "b" "c" "d" "e" "f"
           "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v"
           "w" "x" "y" "z" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "+" "/"])

(fn genes_to_values [str]
  (let [output []]
    (each [c (str:gmatch ".")]
      (table.insert output (string.byte c)))
    output))

(fn values_to_genes [lst]
  (var output "")
  (each [k v (ipairs lst)] (set output (.. output (string.char v))))
  output)

(util.pp (genes_to_values genes))
(util.pp (values_to_genes (genes_to_values genes)))
