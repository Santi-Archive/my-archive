n, m = map(int, input().split())

def DFS(G, v, seen=None, path=None):
    if seen is None:
        seen = []
    if path is None:
        path = [v]

    seen.append(v)

    paths = []
    for t in G[v]:
        if t not in seen:
            t_path = path + [t]
            paths.append(tuple(t_path))
            paths.extend(DFS(G, t, seen[:], t_path))
    return paths

edges = [tuple(input().split()) for _ in range(m)]

G = {}
for s, t in edges:
    if s not in G:
        G[s] = []
    if t not in G:
        G[t] = []
    G[s].append(t)
    G[t].append(s)

print(G)

all_paths = DFS(G, 'A')
print(all_paths)

max_len = max(len(p) for p in all_paths)
max_paths = [p for p in all_paths if len(p) == max_len]

# Output
print("All Paths:")
print(all_paths)
print("Longest Paths:")
for p in max_paths:
    print("  ", p)
print("Longest Path Length:")
print(max_len)