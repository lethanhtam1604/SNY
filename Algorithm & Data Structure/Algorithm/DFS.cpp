#include <iostream>
#include <list>
#include <stack>

using namespace std;

#define MAX 100
int V, E;
bool visited[MAX];
int path[MAX];
list<int> graph[MAX];

void PrintPath(int u, int v, int back[]){
    if(u==v){
        cout << v << " ";
    } else {
        if(back[v]==-1){
            cout << "Khong co duong di";
        } else {
            PrintPath(u, back[v], back);
            cout << v << " ";
        }
    }
}

void DFS(int s){
    for(int i=0;i<V;i++){
        visited[i]=false;
        path[i]=-1;
    }
    stack<int> q;
    visited[s]=true;
    q.push(s);
    list<int>::iterator i;
    while(!q.empty()){
        s=q.top();
        q.pop();
        for(i=graph[s].begin();i!=graph[s].end();i++){
            if(!visited[*i]){
                visited[*i]=true;
                q.push(*i);
                path[*i]=s;
            }
        }
    }
}

int main(){
    freopen("/Users/d/Documents/INPUT.TXT", "rt", stdin);
    int u, v;
    cin >> V >> E;
    for(int i=0;i<E;i++){
        cin >> u >> v;
        graph[u].push_back(v);
        graph[v].push_back(u);
    }
    int s=0;
    int d=5;
    DFS(s);
    PrintPath(s, d, path);

    return 0;
    
}
