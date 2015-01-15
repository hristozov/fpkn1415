import Unit

naturals start = start : naturals (start + 1)
evens = filter even (naturals 1)

main = assertEqual [2, 4, 6] (take 3 evens);