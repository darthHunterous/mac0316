exception Undefined;

val lis = [2,3,4];

fun corta (0, nil) = []
  | corta (0, l) = []
  | corta (i, nil) = raise Undefined
  | corta (i, x::nil) = [x]
  | corta (i, x::l) = [x] @ corta (i-1, l);

corta (2, lis);
corta (3, lis);
corta (1, lis);
corta (0, lis);

corta (0, nil);
corta (1, nil);