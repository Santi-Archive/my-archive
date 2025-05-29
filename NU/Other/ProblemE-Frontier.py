n, m = map(int, input().split())
if not (2 <= n <= 26 and 0 <= m <= n * (n-1)/2):
    quit()

edges = [tuple(input().split()) for _ in range(m)]

graph = {}
for x, y in edges:
    if x not in graph:
        graph[x] = []
    if y not in graph:
        graph[y] = []
    graph[x].append(y)
    graph[y].append(x)