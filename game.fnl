(local fennel (require "fennel"))
(local lume (require "lume"))
(local util (require "util"))

(fn love.load []
)

(fn love.draw []
)

(fn love.keypressed [pressed_key]
  ;; TODO: mode specific keybindings loaded here:

  ;; game controls + dev bindings
  (when (= pressed_key "tab")
    (do
      (print "Reloading")
      (lume.hotswap "main")
      (lume.hotswap "game")))
  (when (= pressed_key "escape")
    (love.event.quit))
  )

;; Genes encoding/decoding

(fn genes_to_values [str]
  (let [output []]
    (each [c (str:gmatch ".")]
      (table.insert output (string.byte c)))
    output))

(fn values_to_genes [lst]
  (var output "")
  (each [k v (ipairs lst)] (set output (.. output (string.char v))))
  output)

(local genes "01234abcdeFGHI56789ABCDE")
(local bs ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P"
           "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "a" "b" "c" "d" "e" "f"
           "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v"
           "w" "x" "y" "z" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "+" "/"])

(util.pp (genes_to_values genes))
(util.pp (values_to_genes (genes_to_values genes)))
