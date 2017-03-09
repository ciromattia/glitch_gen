PImage img; //dichiarazione variabile immagine
int increment=2; //incremento x mouse

void setup() {
  size(700, 466); //dimensioni finestra
  img = loadImage("IMAGE.jpg"); //carica immagine da glitchare
  image(img, 0, 0, width, height);
  loadPixels(); //carica pixel
  for (int x = 0; x < ((width*height)-(increment+2)); x+=increment) {
    quicksort(pixels, x, x+increment);
  }
  updatePixels();
}

void draw() {
  float x = constrain(random(0, 20), 1, width); //movimento x modificare valori in random( , )
  float y = constrain(random (0, 20), 1, height); //movimento y modificare valori in random ( , )
  int val1 = int((sqrt(x*y))*2);
  glitchIt(val1);
  saveFrame(); //questo comando permette di salvare automaticamente le immagini in TIFF
}

void glitchIt(int jump) {
  image(img, 0, 0, 700, 466);
  loadPixels();
  for (int x = 0; x < ((width*height)-(jump+1)); x+=jump) {
    quicksort(pixels, x, x+jump);
  }
  updatePixels();
}

//void mouseMoved() {
//float x = constrain(random(0,700), 1, width);
//float y = constrain(random (0,466), 1, height);
//int val1 = int((sqrt(x*y))*2);
//glitchIt(val1);
//}

int partition(int x[], int left, int right) {
  int i = left;
  int j = right;
  int temp;
  int pivot = x[(left+right)/2];
  while (i <= j) {
    while (x[i] < pivot) {
      i++;
    }
    while (x[j] > pivot) {
      j--;
    }
    if (i <= j) {
      temp = x[i];
      x[i] = x[j];
      x[j] = temp;
      i++;
      j--;
    }
  }
  return i;
}

void quicksort(int x[], int left, int right) {
  int index = partition(x, left, right);
  if (left < index - 1) {
    quicksort(x, left, index-1);
  }
  if (index < right) {
    quicksort(x, index, right);
  }
}