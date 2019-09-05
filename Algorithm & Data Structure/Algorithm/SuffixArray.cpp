#include <iostream>
#include <math.h>
#include <vector>
#include <unordered_map>
#include <map>
#include <string>
#include <algorithm>
#include <queue>
#include <set>
#include <stack>
#include <cstring>
#include <iomanip>
#define MAX 100010
#define MOD 1000000007
#define x first
#define y second
using namespace std;

char data[MAX];
int suffix[MAX] = { 0 };
long long n;

int cmp(const void *a, const void *b) {
	return strcmp(data + *(int*)a, data + *(int*)b);
}

void suffixArray(int n) {
	for (int i = 0; i<n; i++)
		suffix[i] = i;
	qsort(suffix, n, sizeof(int), cmp);
}

long long cntCommonSuffix() {
	long long cnt = 0;
	suffixArray(n);
	for (int i = 1; i<n; i++) {
		int p = 0;
		char *a = data + suffix[i];
		char *b = data + suffix[i - 1];
		while (*a == *b) {
			p++;
			a++;
			b++;
		}
		cnt += p;
	}
	return cnt;
}

long long substringCalculator(char *s) {
	n = strlen(data);
	return n*(n + 1) / 2 - cntCommonSuffix();
}

int main() {
#ifndef ONLINE_JUDGE
	freopen("F:/INPUT.TXT", "rt", stdin);
#endif
	cin >> data;
	cout << substringCalculator(data) << endl;
	return 0;
}