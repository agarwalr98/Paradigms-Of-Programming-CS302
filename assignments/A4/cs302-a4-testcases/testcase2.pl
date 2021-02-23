alloc(a, o1).
alloc(b, o2).
alloc(e,o4).
alloc(c, o3).
load(a, c,f).
copy(b, a).
invoke(m1, [b]).

allescapes -o1,o2
