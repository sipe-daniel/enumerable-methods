
result = 0
sym = :-
[1, 2, 3, 5].each { |i| result = result.method(sym).call(i) } 
p result 
