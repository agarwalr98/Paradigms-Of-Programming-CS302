alloc (a, o1).
alloc(c, o2).
alloc(d,o3).
store(a, f, c).
load(d, a, f).
invoke(m1, [d]).

allescapes -o3,o2