#include <stdio.h>

void sortProcesses(int n, int bt[], int processes[]) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (bt[j] > bt[j + 1]) {
                // Swap burst time
                int temp = bt[j];
                bt[j] = bt[j + 1];
                bt[j + 1] = temp;
                // Swap process numbers
                temp = processes[j];
                processes[j] = processes[j + 1];
                processes[j + 1] = temp;
            }
        }
    }
}

void calculateTimes(int n, int bt[], int wt[], int tat[]) {
    // Calculate waiting time
    wt[0] = 0;
    for (int i = 1; i < n; i++) {
        wt[i] = wt[i - 1] + bt[i - 1];
    }

    // Calculate turnaround time
    for (int i = 0; i < n; i++) {
        tat[i] = wt[i] + bt[i];
    }
}

void displayResults(int n, int processes[], int bt[], int wt[], int tat[]) {
    float totalWT = 0, totalTAT = 0;

    printf("Process\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t\t%d\t\t%d\n", processes[i], bt[i], wt[i], tat[i]);
        totalWT += wt[i];
        totalTAT += tat[i];
    }

    printf("\nAverage Waiting Time: %.2f\n", totalWT / n);
    printf("Average Turnaround Time: %.2f\n", totalTAT / n);
}

int main() {
    int n;

    printf("Enter the number of processes: ");
    scanf("%d", &n);

    int bt[n], wt[n], tat[n], processes[n];

    printf("Enter the burst time for each process:\n");
    for (int i = 0; i < n; i++) {
        processes[i] = i + 1; // Process numbers
        printf("Process %d: ", i + 1);
        scanf("%d", &bt[i]);
    }

    // Sort processes by burst time
    sortProcesses(n, bt, processes);

    // Calculate waiting and turnaround times
    calculateTimes(n, bt, wt, tat);

    // Display results
    displayResults(n, processes, bt, wt, tat);

    return 0;
}
