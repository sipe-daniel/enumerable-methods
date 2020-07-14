newarr = []
hola = lambda {|element| puts newarr << element * 2}

p [1, 2, 3].each(&hola)
p newarr