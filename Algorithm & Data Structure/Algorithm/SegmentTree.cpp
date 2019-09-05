#include <iostream>
#include <math.h>
#include <vector>
#include <unordered_map>
#include <string>
#include <set>
#include <algorithm>
#include <bitset>
#include <stack>
#include <string>
#define MAX 30010
#define MOD 1000000007
#define vt first
#define idx second

using namespace std;

int ST[4*MAX] = {0};

struct Triple {
    int l, r, k, p;
    
    Triple(int a, int b, int c, int d) {
        l = a;
        r = b;
        k = c;
        p = d;
    }
};

bool myFunc(Triple a, Triple b) {
    return a.k < b.k;
}

//update ST[i] = v
void update(int id, int l, int r, int i, int v) {
    if(i<l || i>r) { return; }
    if(l == r) {
        ST[id] = v;
        return;
    }
    int mid = (l+r)/2;
    update(2*id, l, mid, i, v);
    update(2*id + 1, mid+1, r, i, v);
    ST[id] = ST[2*id] + ST[2*id + 1];
}

//get value in segment [u,v]
int get(int id, int l, int r, int u, int v) {
    //l r is outside of [u, v]
    if (v<l || u>r) { return 0;}
    //l r is inside of [u, v]
    if (u<=l && r<=v) {
        return ST[id];
    }
    int mid = (l+r)/2;
    return get(2*id, l, mid, u, v) + get(2*id+1, mid+1, r, u, v);
}

int main() {
#ifndef ONLINE_JUDGE
    freopen("/Users/admin/Documents/INPUT.TXT", "rt", stdin);
#endif
    int n;
    cin >> n;
    int a[MAX];
    int aOffline[MAX];
    unordered_map<int, vector<int> > m;
    for(int i=0;i<n;i++) {
        scanf("%d", &a[i]);
        aOffline[i] = a[i];
        if(m.find(a[i]) == m.end()) {
            m[a[i]] = vector<int>();
        }
        m[a[i]].push_back(i);
    }
    int k;
    cin >> k;
    vector<Triple> query;
    for(int i=0,a,b,c;i<k;i++) {
        scanf("%d %d %d", &a, &b, &c);
        query.push_back(Triple(a, b, c, i));
    }
    sort(aOffline, aOffline + n);
    sort(query.begin(), query.end(), myFunc);
    int j=0;
    int ans[200100];
    for(Triple t : query) {
        while(j<n && t.k>=aOffline[j]) {
            for(int p : m[aOffline[j]]) {
                update(1, 1, n, p+1, 1);
            }
            j++;
        }
        ans[t.p] = t.r - t.l + 1 - get(1, 1, n, t.l, t.r);
    }
    for(int i=0;i<k;i++) {
        printf("%d\n", ans[i]);
    }
    return 0;
}










