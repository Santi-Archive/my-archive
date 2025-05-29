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

def dfs(graph, current, visited, path):
    path.append(current)
    visited.add(current)

    longest = list(path)

    for neighbor in graph[current]:
        if neighbor not in visited:
            new_path = dfs(graph, neighbor, visited.copy(), path.copy())
            if len(new_path) > len(longest):
                longest = new_path

    return longest

start = edges[0][0]
longest_path = dfs(graph, start, set(), [])
print(len(longest_path))