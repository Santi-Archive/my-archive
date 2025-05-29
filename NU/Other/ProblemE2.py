n, m = map(int, input().split())
graph = {}

for _ in range(m):
    x, y = input().split()
    if x not in graph:
        graph[x] = []
    if y not in graph:
        graph[y] = []
    graph[x].append(y)
    graph[y].append(x)

print(graph)