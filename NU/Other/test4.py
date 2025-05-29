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

longest_path = 0
def dfs(node, graph, path, explored):
    global longest_path
    for neighbor in graph[node]:
        if neighbor not in explored:
            path.append(neighbor)
            explored.add(neighbor)
            dfs(neighbor, graph, path, explored)
            path.remove(neighbor)
            explored.remove(neighbor)
    if len(path) > longest_path:
        longest_path = len(path)

for node in graph:
    dfs(node, graph, path=[node], explored={node})

print(longest_path)