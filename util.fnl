(local lume (require "lume"))
(local fennel (require "fennel"))

(local pp (fn [x] (print (fennel.view x))))

(lambda smart-concat [tbl potential-list]
  (if (= (type potential-list) "string") (table.insert tbl potential-list)
      (= (type potential-list) "table") (lume.concat tbl potential-list)))

;; Exports
{:pp pp
 :smart-concat smart-concat}
