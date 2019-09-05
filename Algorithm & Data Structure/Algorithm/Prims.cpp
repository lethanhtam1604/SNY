#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <queue>
#include <algorithm>
#include <functional>
#include <string.h>

using namespace std;
#define MAX 1010

const int INF=1e9;
vector<pair<int, int> > graph[MAX];
vector<int> dist(MAX, INF);
bool visited[MAX];
int N;

int showResult() {
    int ans = 0;
    for(int i=1; i<=N; i++) {
        ans += dist[i];
    }
    return ans;
}

void prims(int src){
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int> > > pq;
    pq.push(make_pair(0, src));
    dist[src] = 0;
    while(!pq.empty()){
        int u = pq.top().second;
        pq.pop();
        visited[u] = true;
        for(int i=0;i<graph[u].size();i++) {
            int v = graph[u][i].first;
            int w = graph[u][i].second;
            if (!visited[v] && dist[v] > w) {
                dist[v] = w;
                pq.push(make_pair(w, v));
            }
        }
    }
}

int main() {
#ifndef ONLINE_JUDGE
    freopen("/Users/d/Documents/INPUT.TXT", "rt", stdin);
#endif
    int T;
    cin >> T;
    while(T--) {
        int p, M, u, v, w;
        cin >> p >> N >> M;
        for(int i=0;i<M;i++){
            cin >> u >> v >> w;
            graph[u].push_back(make_pair(v, w));
            graph[v].push_back(make_pair(u, w));
        }
        prims(1);
        cout << showResult()*p << endl;
        for(int i=0;i<N;i++) {
            graph[i].clear();
            visited[i] = false;
            dist[i] = INF;
        }
    }
    return 0;
}
