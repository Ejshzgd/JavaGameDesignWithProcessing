/* Game Class Starter File
 * Authors: Carey Jiang
 * Last Edit: 6/6/2023
 */

//import processing.sound.*;

//GAME VARIABLES
private int msElapsed = 0;
String titleText = "HorseChess";
String extraText = "Who's Turn?";

//Screens
Screen currentScreen;
World currentWorld;
Grid currentGrid;

//Splash Screen Variables
Screen splashScreen;
String splashBgFile = "images/apcsa.png";
PImage splashBg;

//Sky Screen Variables
Grid mainGrid;
String mainBgFile = "images/chess.jpg";
PImage mainBg;

PImage player1;
String player1File = "images/x_wood.png";
int player1Row = 3;
int health = 3;

PImage enemy;
AnimatedSprite enemySprite;

AnimatedSprite exampleSprite;
boolean doAnimation;

//EndScreen variables
World endScreen;
PImage endBg;
String endBgFile = "images/youwin.png";

//Example Variables
//HexGrid hGrid = new HexGrid(3);
//SoundFile song;


//Required Processing method that gets run once
void setup() {

  //Match the screen size to the background image size
  size(800,600);
  
  //Set the title on the title bar
  surface.setTitle(titleText);

  //Load BG images used
  splashBg = loadImage(splashBgFile);
  splashBg.resize(800,600);
  mainBg = loadImage(mainBgFile);
  mainBg.resize(800,600);
  endBg = loadImage(endBgFile);
  endBg.resize(800,600);

  //setup the screens/worlds/grids in the Game
  splashScreen = new Screen("splash", splashBg);
  mainGrid = new Grid("chessBoard", mainBg, 6, 8);
  endScreen = new World("end", endBg);
  currentScreen = splashScreen;

  //setup the sprites  
  player1 = loadImage(player1File);
  player1.resize(mainGrid.getTileWidthPixels(),mainGrid.getTileHeightPixels());
  // enemy = loadImage("images/articuno.png");
  // enemy.resize(100,100);
  exampleAnimationSetup();

  //Adding pixel-based Sprites to the world
  // mainGrid.addSpriteCopyTo(exampleSprite);
  mainGrid.printSprites();
  System.out.println("Done adding sprites to main world..");

  
  //Other Setup
  // Load a soundfile from the /data folder of the sketch and play it back
  // song = new SoundFile(this, "sounds/Lenny_Kravitz_Fly_Away.mp3");
  // song.play();
  
  imageMode(CORNER);    //Set Images to read coordinates at corners
  //fullScreen();   //only use if not using a specfic bg image
  println("Game started...");

}

//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
void draw() {

  updateTitleBar();

  //handle sprites on screen
  if (msElapsed % 300 == 0) {
    populateSprites();
    moveSprites();
  }
  updateScreen();
  
  //check for end of game
  if(isGameOver()){
    endGame();
  }
  
  //handle timing
  msElapsed +=100;
  currentScreen.pause(100);

}

//Known Processing method that automatically will run whenever a key is pressed
void keyPressed(){

  //check what key was pressed
  System.out.println("Key pressed: " + keyCode); //keyCode gives you an integer for the key

  //What to do when a key is pressed?
  
  //set [W] key to move the player1 up & avoid Out-of-Bounds errors
  if(keyCode == 87){
   
    //Store old GridLocation
    GridLocation oldLoc = new GridLocation(player1Row, 0);

    //Erase image from previous location
    

    //change the field for player1Row
    player1Row--;
  }


}

//Known Processing method that automatically will run when a mouse click triggers it
void mouseClicked(){
  
  //check if click was successful
  System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")");
  if(currentGrid != null){
    System.out.println("Grid location: " + currentGrid.getGridLocation());
  }

  //what to do if clicked? (Make player1 jump back?)
  


  //Toggle the animation on & off
  doAnimation = !doAnimation;
  System.out.println("doAnimation: " + doAnimation);
  if(currentGrid != null){
    currentGrid.setMark("X",currentGrid.getGridLocation());
  }

}




//------------------ CUSTOM  METHODS --------------------//

//method to update the Title Bar of the Game
public void updateTitleBar(){

  if(!isGameOver()) {
    //set the title each loop
    surface.setTitle(titleText + "    " + extraText + " " + health);

    //adjust the extra text as desired
  
  }

}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //Update the Background
  background(currentScreen.getBg());

  //splashScreen update
  if(splashScreen.getScreenTime() > 3000 && splashScreen.getScreenTime() < 5000){
    currentScreen = mainGrid;
  }

  //skyGrid Screen Updates
  if(currentScreen == mainGrid){
    currentGrid = mainGrid;

    //Display the Player1 image
    GridLocation player1Loc = new GridLocation(player1Row,0);
    mainGrid.setTileImage(player1Loc, player1);
      
    //update other screen elements
    mainGrid.showSprites();
    mainGrid.showImages();
    mainGrid.showGridSprites();

    checkExampleAnimation();
    
  }

  //Other screens?


}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){

  //What is the index for the last column?
  

  //Loop through all the rows in the last column

    //Generate a random number


    //10% of the time, decide to add an enemy image to a Tile
    

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){

//Loop through all of the rows & cols in the grid

      //Store the current GridLocation

      //Store the next GridLocation

      //Check if the current tile has an image that is not player1      


        //Get image/sprite from current location
          

        //CASE 1: Collision with player1


        //CASE 2: Move enemy over to new location


        //Erase image/sprite from old location

        //System.out.println(loc + " " + grid.hasTileImage(loc));

          
      //CASE 3: Enemy leaves screen at first column

}

//Method to check if there is a collision between Sprites on the Screen
public boolean checkCollision(GridLocation loc, GridLocation nextLoc){

  //Check what image/sprite is stored in the CURRENT location
  // PImage image = grid.getTileImage(loc);
  // AnimatedSprite sprite = grid.getTileSprite(loc);

  //if empty --> no collision

  //Check what image/sprite is stored in the NEXT location

  //if empty --> no collision

  //check if enemy runs into player

    //clear out the enemy if it hits the player (using cleartTileImage() or clearTileSprite() from Grid class)

    //Update status variable

  //check if a player collides into enemy

  return false; //<--default return
}

//method to indicate when the main game is over
public boolean isGameOver(){
  
  return false; //by default, the game is never over
}

//method to describe what happens after the game is over
public void endGame(){
    System.out.println("Game Over!");

    //Update the title bar

    //Show any end imagery
    currentScreen = endScreen;

}

//example method that creates 1 horse run along the screen
public void exampleAnimationSetup(){  
  int i = 2;
  exampleSprite = new AnimatedSprite("sprites/horse_run.png", "sprites/horse_run.json", 50.0, i*75.0);
  //exampleSprite.resize(200,200);
}

//example method that animates the horse Sprites
public void checkExampleAnimation(){
  if(doAnimation){
    exampleSprite.animateHorizontal(5.0, 1.0, true);
    //System.out.println("animating!");
  }
}
