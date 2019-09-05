#include <iostream>
#include <set>
using namespace std;
#define MAX 1e16 + 5

struct Node {
    long long key;
    Node *left;
    Node *right;
};
long long mi=MAX;
Node* createNode(long long x) {
    Node *newnode = new Node;
    newnode->key = x;
    newnode->left = newnode->right = NULL;
    return newnode;
}

Node* insertNode(Node* root, long long x) {
    if(root == NULL) {
        return createNode(x);
    }
    if(root->key - x < mi && root->key - x > 0) {
        mi = root->key - x;
    }
    if(x < root->key) {
        root->left = insertNode(root->left, x);
    } else if(x > root->key) {
        root->right = insertNode(root->right, x);
    }
    return root;
}

int main() {
#ifndef ONLINE_JUDGE
    freopen("/Users/d/Documents/INPUT.TXT", "rt", stdin);
#endif
    int n;
    scanf("%d", &n);
    long long temp;
    cin >> temp;
    Node* bst = createNode(temp);
    for(int i=0;i<n;i++) {
        scanf("%lld", &temp);
        insertNode(bst, temp);
    }
    printf("%lld\n", mi);
}
