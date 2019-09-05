#include <iostream>
#include <algorithm>
#include <vector>
#include <unordered_map>
using namespace std;
#define MAX 100010

vector<int> parent(MAX, 0);
vector<int> num(MAX, 0);

int findSet(int u) {
    while(u != parent[u]) {
        u = parent[u];
    }
    return u;
}

int unionSet(int u, int v) {
    int up = findSet(u);
    int vp = findSet(v);
    if(up != vp && u != v) {
        parent[vp] = up;
        int k = num[up] + num[vp];
        num[vp] = num[up] = k;
    }
    return num[up];
}

int main() {
#ifndef ONLINE_JUDGE
    freopen("/Users/d/Documents/INPUT.TXT", "rt", stdin);
#endif
    int T;
    cin >> T;
    while(T--) {
        int N;
        cin >> N;
        int k = 1;
        unordered_map<string, int> A;
        for(int i=0;i<N;i++) {
            char s1[20], s2[20];
            scanf("%s %s", s1, s2);
            string a(s1), b(s2);
            if(A[a] == 0) {
                A[a] = k++;
                num[A[a]] = 1;
                parent[A[a]] = A[a];
            }
            if(A[b] == 0) {
                A[b] = k++;
                num[A[b]] = 1;
                parent[A[b]] = A[b];
            }
            printf("%d\n", unionSet(A[a], A[b]));
        }
        parent.clear();
        num.clear();
    }
    return 0;
}
