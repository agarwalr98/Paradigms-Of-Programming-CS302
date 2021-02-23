alloc(b,o1).
alloc(a,o2).
copy(b,a).
alloc(c,o3).
store(a,f,c).
invoke(m1,[b]).

allescapes -o1,o2,o3.