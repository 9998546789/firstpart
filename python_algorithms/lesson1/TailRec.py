def func_rec(a, b):
    if a == b:
        return f"{a}"

    if a > b:
        return f"{a} {func_rec(a - 1, b)}"

    if a < b:
        return f"{a} {func_rec(a + 1, b)}"


def func_tail_rec(a, b, acc):
    if a == b:
        return acc

    if a > b:
        return func_tail_rec(a - 1, b, f"{acc} {a}")

    if a < b:
        return func_tail_rec(a + 1, b, f"{acc} {a}")

#print(func_tail_rec(1, 1000, " "))

# tail_recursion.py
class Recurse(Exception):
    def __init__(self, *args, **kwargs):
        self.args = args
        self.kwargs = kwargs


def recurse(*args, **kwargs):
    raise Recurse(*args, **kwargs)


def tail_recursive(f):
    def decorated(*args, **kwargs):
        while True:
            try:
                return f(*args, **kwargs)
            except Recurse as r:
                args = r.args
                kwargs = r.kwargs
                continue

    return decorated


@tail_recursive
def tail_factorial(n, accumulator=1):
  if n == 0: return accumulator
  else: return tail_factorial(n-1, accumulator * n)

print(tail_factorial(1000))