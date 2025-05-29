while True: # constraints 1 and 2
    n, m = map(int, input().split())
    if 2 <= n <= 26 and 0 <= m <= n * (n-1)/2:
        break
    else:
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

def dfs_longest(graph, current, visited, path):
    path.append(current)
    visited.add(current)

    longest = list(path)

    for neighbor in graph[current]:
        if neighbor not in visited:
            new_path = dfs_longest(graph, neighbor, visited.copy(), path.copy())
            if len(new_path) > len(longest):
                longest = new_path

    return longest

start = edges[0][0]
longest_path = dfs_longest(graph, start, set(), [])
print(len(longest_path))