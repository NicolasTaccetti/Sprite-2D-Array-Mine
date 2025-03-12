/* Nicolas Taccetti
3/12/25
Learning to create a sprite and iterate it in a 2D array with a framerate.
*/
int cols = 6;  // 6 columns
int rows = 5;  // 5 rows
Sprite[][] sprites; // 2d array of sprites

int numFrames = 31;  // number of frames in sprite
PImage[] spriteFrames; // initializing image
int frameDelay = 9;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  // load sprite frames
  sprites = new Sprite[cols][rows];

  // creates 2d array and iterates through it, replacing each element with a sprite

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * width / cols + width / (cols * 2);
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(0);
  
  // iterating through array, updating and displaying sprites
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// loading in the sprites
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("piggySprite_" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 50; // size of sprites
  float speedX = 0.75; // speed of sprites moving across

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // iterating through the frames
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // moves the sprites across the x access
    x += speedX;

    // loops sprite position back to start (x=0) of screen when sprite reaches end
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
