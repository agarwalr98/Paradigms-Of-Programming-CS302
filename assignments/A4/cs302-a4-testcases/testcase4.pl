alloc(a, o1). 
alloc(b, o2). 
alloc(c, o3). 
alloc(d, o4). 
alloc(d,o6).
alloc(e, o5). 
copy(b,a).
copy(a,b).
store(b, f, e).
store(a, f, c).
load(d, b, f).
invoke(m1, [b]).

allescapes -o2,o1,o5,o3.