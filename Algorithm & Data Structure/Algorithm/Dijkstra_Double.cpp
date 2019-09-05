#include <iostream>
#include <math.h>
#include <vector>
#include <queue>
#include <iomanip>
using namespace std;
#define MAX 1100
const int INF=1e9;
//Bài 3 buổi 18
void dijkstra(int source, vector<vector<pair<int, double> > > v, vector<double> distance){
    priority_queue<pair<double, int>, vector<pair<double, int> >, greater<pair<int, double>>> pq;
    pq.push(pair<double, int>(0, source));
    
    distance[source] = 0;
    while(!pq.empty()){
        pair<double, int> top = pq.top();
        pq.pop();
        int node = top.second;
        double d= top.first;
        for(int i=0;i<v[node].size();++i){
            pair<int, double> neighbor = v[node][i];
            if(d + neighbor.second < distance[neighbor.first]) {
                distance[neighbor.first] = d + neighbor.second;
                pq.push(pair<double, int>(distance[neighbor.first], neighbor.first));
            }
        }
    }
}

