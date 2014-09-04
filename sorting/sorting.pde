//PDE X mode
int[] test =
{
  2, 5, 9, 3, 1, 7, 4, 6
};

void setup() {
  size(300, 300);
  //Double-click test, hit "Variable Inspector" button (looks like equal sign)
  //Hit "Test" in Variable Inspector
  bubbleSort(test);
} //<>//

void bubbleSort(int[] input) {
  boolean swapped = true;
  while (swapped) {
    swapped = false;
    for (int i=1; i < input.length; i++) {
      if (input[i-1] > input[i]) {
        int swap = input[i-1];
        input[i-1] = input[i];
        input[i] = swap ;
        swapped = true;
      }
    }
  }
}
