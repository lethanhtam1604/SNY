//GCD: tìm ước chung lớn nhất
int gcd(int x, int y) {
    if (y == 0) return x;
    else return gcd(y, x % y);
}

//sieve
long long F[MAX] = {0};

void sieve() {
    for(long long i=2;i<=sqrt(MAX);i++) {
        for(long long j=i*i;j<=MAX;j+=i) {
            F[j] = min(F[j], i);
        }
    }
}

int main() {
    for(long long i=2;i<MAX;i++) {
        F[i] = i;
    }
    sieve();
    return 0;
}

//set
//iteration
for(int i : st) {
    //i is item in set st
}
//get last element
*st.rbegin()
//get first element
*st.begin()





//upper_bound, lower_bound dùng với vector
upper_bound(st[id].begin(), st[id].end(), k) - st[id].begin()

int myints[] = {10,20,30,30,20,10,10,20};
std::vector<int> v(myints,myints+8);           // 10 20 30 30 20 10 10 20

std::sort (v.begin(), v.end());                // 10 10 10 20 20 20 30 30

    std::vector<int>::iterator low,up;
low=std::lower_bound (v.begin(), v.end(), 20); //          ^
up= std::upper_bound (v.begin(), v.end(), 20); //                   ^

//upper_bound, lower_bound dungf với set
myset.upper_bound(60) //return iterator




//merge 2 vector
vector<int> a({5,10,15,20,25});
vector<int> b({50,40,30,20,10});
vector<int> v;
sort(a.begin(), a.end());
sort(b.begin(), b.end());
v = vector<int>(a.size() + b.size());       //Phải khao báo trước số lượng phần tử của v, nếu ko sẽ lỗi
merge(a.begin(),a.end(),b.begin(),b.end(),v.begin());
//merge 2 set
ST[id] = set<int>(ST[id*2]);            //copy s1 -> s0
ST[id].insert(ST[id*2+1].begin(), ST[id*2+1].end());            //insert s2 -> s0, ket qua s0 = merge(s1, s2)




//hash unordered_map
//iteration
for (auto it = map.begin(); it!=map.end();++it) {
    if(it->second >= k-1) {
        mx = max(mx, it->first);
    }
}
for(auto p: m) {
    cout << p.second << " ";
}

//Hàm toán tử
struct Triple {
    int l, r, k;
    
    Triple(int a, int b, int c) {
        l = a;
        r = b;
        k = c;
    }
    
    bool operator> (const Triple &b) {
        return k > b.k;
    }
    bool operator< (const Triple &b) {
        return k < b.k;
    }
    bool operator== (const Triple &b) {
        return k == b.k;
    }
};


//DFS đối với cây
void dfs(int v=1, int p=0) {
    for(int u : graph[v]) {
        if(u == p) continue;
        dfs(u, v);
    }
    //do we need
}


//Chuyển đổi nhị phân thập phân
string decimalToBinary(long long k) {
    string binary = std::bitset<64>(k).to_string(); //to binary
    int begin = 0;
    while(binary[begin] == '0') begin++;
    string result = binary.substr(begin, binary.size());
    return result;
}

long long binaryToDecimal(string binary) {
    long long result = bitset<64>(binary).to_ulong();
    return result;
}

//lấy hoán vị của 1 mảng trong C++
int myints[] = {1,2,3};
sort (myints,myints+3);
do {
    cout << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';
} while ( next_permutation(myints,myints+3) );
cout << "After loop: " << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';

//************************************************************************************
//giai thua, factorial
long long fac[MAX] = {0};

void factorial(int n) {
    fac[0] = 1;
    fac[1] = 1;
    for(int i=2;i<n;i++) {
        fac[i] = fac[i-1]*i;
        fac[i] %= MOD;
    }
}
    
//ket hop ben duoi de hoan vi
//combination
long long power(int x, unsigned int y) {
    if (y == 0)
        return 1;
    long long p = power(x, y/2) % MOD;
    p = (p * p) % MOD;
    return (y%2 == 0)? p : (x * p) % MOD;
}

long long combination(int n, int k) {
    k = min(n-k, k);
    long long a=fac[n], b = fac[n-k] * fac[k];
    b %= MOD;
    long long result = a * power((int)b, MOD-2);
    result %= MOD;
    return result;
}
//link submit tham khao http://codeforces.com/contest/300/my
//************************************************************************************

//Find minimum cut
//Use Ford_Fulkerson
//Link submit tham khao: https://www.hackerrank.com/contests/w37/challenges/two-efficient-teams

//unordered_map with struct
//Muốn dùng hash table với stuct as object ta phải dùng con trỏ cho struct
//Muốn dùng hash table với stuct as key ta phải tự viết hàm hashing cho struct đó, cái này khá nâng cao, bỏ qua 
struct Node {

	int x;
	string y;

	Node(int a, string b) {
		x = a;
		y = b;
	}
};

int main() {
	unordered_map<int, Node*> m;
	m[1] = new Node(4, "duy");
	m[2] = new Node(2, "nhat");
	cout << m[2]->y << endl;		//in ra: nhat
	return 0;
}
    
// Time
int count = 200 (minutes);
int hh = hh + count / 60;
int mi = count % 60;
    
// Maxtrix - Get neighbor cells (8)
char c[200][200];
int dx[] = {0, 0, -1, 1, -1, -1, 1, 1};
int dy[] = {1, -1, 0, 0, -1, 1, -1, 1};
int n,m;
    
bool in(int x, int y)
{
    return x >= 0 && x < n && y < m && y >= 0;
}
    
// the fastest way
for(int i =-1;i<=1;i++) {
    for(int j=-1;j<=1;j++) {
        if(i != 0 && j != 0) {
        
        }
    }
}
    
// Maxtrix - Get neighbor cells (4)
char c[200][200];
int dx[] = {0, 1, 0, -1};
int dy[] = {1, 0, -1, 0};
int n,m;
    
bool in(int x, int y)
{
    return x >= 0 && x < n && y < m && y >= 0;
}

// the fastest way
for(int i =-1;i<=1;i++) {
    for(int j=-1;j<=1;j++) {
        if(abs(i) != abs(j)) {
                
        }
    }
}
    
// Round number
#include <math.h>
value = round( value * 1000.0 ) / 1000.0;
    
sử dụng hàm round tốt hơn nhiều so với setprecision, setprecision không dùng được ở câu
https://www.hackerrank.com/contests/w37/challenges/the-average-rating-of-top-employees

// Long long TLE
//scanf long long, sư dụng %I64d cho từng thằng, ko được gộp chung
scanf("%I64d %I64d %I64d", &b, &a, &b);     error
    
scanf("%I64d", &p);
scanf("%I64d", &q);
scanf("%I64d", &b);
long long p, q, b; scanf("%lld %lld %lld", &p, &q, &b); // Should use lld can cin together


// check a string is substring of an other string or not
    bool check(string a, string b) {
        for (int i = 0; i <= (int) b.size() - a.size(); i++) {
            if (b.substr(i, (int) a.size()) == a) {
                return true;
            }
        }
        
        return false;
    }
