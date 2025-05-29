n, m = map(int, input().split())
graph = [[] for _ in range(m)]
for _ in range(m):
    u, v = input().split()
    graph[u].append(v)
    graph[v].append(u)

print(graph)