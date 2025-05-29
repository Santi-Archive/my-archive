while True: # constraints 1 and 2
    n, m = map(int, input().split())
    if 2 <= n <= 26 and 0 <= m <= n * (n-1)/2:
        break
    else:
        quit()

# apply constraint 3 here
edges = [tuple(input().split()) for _ in range(m)]

# constraint 4 ???
graph = {}
for x, y in edges:
    if x not in graph:
        graph[x] = []
    if y not in graph:
        graph[y] = []
    graph[x].append(y)
    graph[y].append(x)

#
def dfs(graph):
    stack = []
    frontier = []
    counter = 0
    start = edges[0][0]
    stack.append(start)
    while stack:
        current = stack.pop()
        if current not in frontier:
            frontier.append(current)
            for neighbor in graph[current]:
                if neighbor not in frontier:
                    stack.append(neighbor)
                    counter += 1
    return counter

result = dfs(graph)
print(result)