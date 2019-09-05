#include <iostream>
#include <algorithm>
#include <vector>
#include <unordered_map>
using namespace std;
#define MAX 300010

unordered_map<string, string> parent;

//Bài 1: 501B - Misha and Changing Handles

//Dùng thuật toán DSU với mảng parent là unordered_map<string, string>

//Bước 1: Đọc dữ liệu Input, với mỗi chuỗi a b tại dòng thứ i.
//Ta gán:   + parent[a] = a nếu key value a chưa tồn tại trong parent
//          + parent[b] = a
//     Lưu mọi giá trị b vào vector<string> B

//Bước 2: Duyệt ngược mảng B rồi gọi findSet(B[i]) để tìm ra parent. Sử lý thêm 1 số điểm cơ bản để không bị trùng lặp parent.

string findSet(string u) {
    while(u != parent[u]) {
        u = parent[u];
    }
    return u;
}

int main() {
#ifndef ONLINE_JUDGE
    freopen("/Users/d/Documents/INPUT.TXT", "rt", stdin);
#endif
    int N;
    cin >> N;
    vector<string> B;
    for(int i=0;i<N;i++) {
        string a, b;
        cin >> a >> b;
        if(parent.find(a) == parent.end()) {
            parent[a] = a;
        }
        parent[b] = a;
        B.push_back(b);
    }
    unordered_map<string, bool> available;
    vector<pair<string, string> > r;
    for(int i=N-1;i>=0;i--) {
        string f = findSet(B[i]);
        if(available[f] == false) {
            r.push_back(pair<string, string>(f, B[i]));
            available[f] = true;
        }
    }
    cout << r.size() << endl;
    for(pair<string, string> s: r) {
        cout << s.first << " " << s.second << endl;
    }
    return 0;
}
