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

def find_longest(graph):
    def dfs(node, explored):
        explored.add(node)
        longest = 0
        for neighbor in graph[node]:
            if neighbor not in explored:
                longest = max(longest, 1 + dfs(neighbor, explored))
        explored.remove(node)
        return longest
    
    return max(dfs(node, set()) for node in graph)

print(find_longest(graph) + 1)