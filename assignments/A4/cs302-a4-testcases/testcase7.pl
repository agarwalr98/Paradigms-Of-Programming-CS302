alloc(a, o1).
alloc(b, o2).
alloc(c, o3).
alloc(f, o4).
alloc(g, o5).
alloc(h, o6).
alloc(i, o7).
alloc(j, o8).
alloc(k, o9).
store(f,f,g).
store(f,g,f).
store(g,g,f).
store(a, f, c).
load(d, a, f).
load(h,f,f).
copy(i,j).
copy(j,k).
copy(k,i).
invoke(m1, [a]).
invoke(m2, [d]).
invoke(m3, [a,b,c,d]).
invoke(m4, [h]).
invoke(m5, [f]).
invoke(m6, [i,j,k]).
invoke(m7, [j]).