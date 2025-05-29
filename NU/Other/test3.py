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

def dfs(graph, start, visited=None):
    if visited is None:
        visited = set()

    print(start, end=' ')
    visited.add(start)

    for neighbor in graph.get(start, []):
        if neighbor not in visited:
            dfs(graph, neighbor, visited)

dfs(graph, "A")
