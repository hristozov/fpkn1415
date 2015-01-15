import Unit

evens = filter even [1..]

main = assertEqual [2, 4, 6] (take 3 evens);