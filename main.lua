local fennel = require("fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)

require("game") -- will compile and load code in main.fnl
