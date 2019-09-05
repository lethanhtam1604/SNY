#include <iostream>
#include <math.h>
#include <vector>
#include <unordered_map>
#include <string>
#include <algorithm>
#define MAX 3

using namespace std;

struct Node {
    Node *child[26];
    bool isLeaf = false;
};

Node *newNode() {
    Node *node = new Node;
    node->isLeaf = false;
    for(int i=0;i<MAX;i++) {
        node->child[i] = NULL;
    }
    return node;
}

void addWord(Node *root, string s) {
    int ch;
    Node *temp = root;
    for(int i=0;i<s.length();i++) {
        ch = s[i] - 'a';
        if(temp->child[ch] == NULL) {
            temp->child[ch] = newNode();
        }
        temp = temp->child[ch];
    }
    temp->isLeaf = true;
}

bool findWord(Node *root, string s) {
    int ch;
    Node *temp = root;
    for(int i=0;i<s.length();i++) {
        ch = s[i] - 'a';
        if(temp->child[ch] == NULL) {
            return false;
        }
        temp = temp-> child[ch];
    }
    return temp->isLeaf;
}

int main()
{
#ifndef ONLINE_JUDGE
    freopen("/Users/d/Documents/INPUT.TXT", "rt", stdin);
#endif
    int n, m;
    cin >> n >> m;
    string a;
    cin.ignore();
    Node *root = newNode();
    for(int i=0;i<n;i++) {
        getline(cin, a);
        addWord(root, a);
    }
    for(int i=0;i<m;i++) {
        getline(cin, a);
        if(findWord(root, a)) cout << "YES" << endl;
        else cout << "NO" << endl;
    }
    return 0;
}
