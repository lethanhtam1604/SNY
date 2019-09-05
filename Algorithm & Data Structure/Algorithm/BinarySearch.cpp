#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;
#define MAX 100010

//Bài 1: HACKRNDM

//B1: Đọc dữ liệu đầu vào lưu vào mảng data
//B2: Sắp xếp mảng
//B3: Duyệt tất cả các phần tử của mảng. Với mỗi phần tử data[i] ta dùng Binary Search tìm xem có
//      tồn tại giá trị "data[i] + k" hoặc "data[i] - k" hay không. Nếu có thì tăng biến đếm r
//B4: In ra giá trị r, r chính là đáp số cần tìm

int n;
int data[MAX];

int BS(int data[], int x) {
    int left=0, right = n - 1;
    int mid;
    while(left<=right) {
        mid = (left + right) / 2;
        if(data[mid] > x) {
            right = mid - 1;
        } else if(data[mid] < x) {
            left = mid + 1;
        } else {
            return mid;
        }
    }
    return -1;
}



int main() {
#ifndef ONLINE_JUDGE
    freopen("/Users/d/Documents/INPUT.TXT", "rt", stdin);
#endif
    int k;
    cin >> n >> k;
    for(int i=0;i<n;i++) {
        scanf("%d", &data[i]);
    }
    sort(data, data + n);
    int r=0;
    for(int i=0;i<n;i++) {
        int temp = BS(data, data[i] - k);
        if(temp != -1) {
            r++;
        }
        temp = BS(data, data[i] + k);
        if(temp != -1) {
            r++;
        }
    }
    printf("%d\n", r/2);
    return 0;
}


//Binary Search Trường hợp 2: Cho day số từ 1 đến N
// Ta cần tìm K với các giá trị từ 1 -> K - 1 là False, từ K đến N là True

long long l=1, r=2e9, mid;
while(r - l > 1) {
    mid = (l + r)/2;
    if(check((int)mid))
        r = mid;
    else
        l = mid;
}
cout << r << endl;



