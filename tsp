#include <stdio.h>



int n, cost[10][10];
int visited[10];
int minCost = INF;


int min(int a, int b) {
    return (a < b) ? a : b;
}

void tsp(int city, int count, int currCost) {
   
    if (count == n && cost[city][0] > 0) {
        minCost = min(minCost, currCost + cost[city][0]);
        return;
    }

    for (int i = 0; i < n; i++) {
        if (!visited[i] && cost[city][i] > 0) {
            visited[i] = 1;
            tsp(i, count + 1, currCost + cost[city][i]);
            visited[i] = 0; // backtrack
        }
    }
}

int main() {
    printf("Enter number of cities: ");
    scanf("%d", &n);

    printf("Enter cost matrix:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &cost[i][j]);
        }
    }

  
    for (int i = 0; i < n; i++) {
        visited[i] = 0;
    }

    visited[0] = 1; // start from city 0

    tsp(0, 1, 0);

    printf("Minimum travelling cost: %d\n", minCost);

    return 0;
}
