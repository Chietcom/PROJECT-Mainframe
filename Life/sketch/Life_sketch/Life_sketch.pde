/****
*    Life_sketch by Tyrone Voß
*    22.04.17 
*/

//Array for "Life"
boolean grid[][];
boolean start;
//setup
void setup()
{
  size(550,550);
  frameRate(1);
  stroke(100);
  grid = new boolean[50][50];
  start = false;
  reset();
}
//draw
void draw()
{
  life();
  drawGrid();
}

//Life algorythm
void life()
{
  if(start == true)
  {
    boolean tmp[][] = new boolean[grid.length][grid.length];
    for(int i = 0; i < grid.length; i++)
    {
     for(int j = 0; j < grid.length; j++)
     { 
       tmp[i][j] = grid[i][j];
     }
   }
    for(int i = 0; i < grid.length; i++)
    {
      for(int j = 0; j < grid.length; j++)
      {
        
        int sum = sumGrid(j , i , tmp); //<>//
        
        //setting the new state of a cell
        if(grid[i][j] == false) //<>//
        {
          if(sum == 3)
          {
            grid[i][j] = true;
          }
        }
        else
        {
          if(sum < 3 || sum > 4)
          {
            grid[i][j] = false; //<>//
          }
        }
        
      }
    }
  }
}
//Sum of living cell in a 3x3 block       (x,y coordinate of middle of the block) //<>//
int sumGrid(int x, int y, boolean [][]tmp)
{
  int sum = 0;
  
  //if-clause for the edges
  if(x == 0)
  {
    x = 49;
  }
  else
  {
    x--;
  }
  
  //if-clause for the edges
  if(y == 0)
  {
    y = 49;
  }
  else
  {
    y--;
  }
  
  for(int i = 0; i < 3; i++)
  { //<>//
    for(int j = 0; j < 3; j++)
    {
      //Sum+1 for every living cell
      if(tmp[y][x] == true)
      {
        sum++;
      }
      
      //if-clause for the edges
      if(x == 49)
      {
        x = 0;
      }
      else
      {
        x++;
      }
    }
    
    //if-clause for the edges
    if(y == 49)
    {
      y = 0;
    }
    else
    {
      y++;
    }
    
    //if-clause for the edges
    if(x == 0)
    {
      x = 47;
    }
    else if(x == 1)
    {
      x = 48;
    }
    else if(x == 2)
    {
      x = 49;
    }
    else
    {
      x -= 3;
    }
  }
  
  return sum;
}

//Mouseclick
void mouseClicked()
{
  //Gives live to a dead cell on click
  int y = (mouseY - 25) / 10;
  int x = (mouseX - 25) / 10;
  if(grid[y][x] == false)
  {
    grid[y][x] = true;
  }
}
//Keypress
void keyReleased()
{
  //Start or stops the game on Backspace press
  if(keyCode == BACKSPACE)
  {
    if(start == false)
    { 
      start = true;
    }
    else
    {
      start = false;
    }
  }
}
//draws the Grid
void drawGrid()
{
  for(int i=0; i < grid.length; i++)
  {
    for(int j = 0; j < grid.length; j++)
    {
      if(grid[i][j] == false)
      {
        fill(255);
        rect(j*10+25,i*10+25,10,10);
      }
      else
      {
        fill(0);
        rect(j*10+25,i*10+25,10,10);
      }
    }
  }
}

//Kills everything
void reset()
{
  for(int i=0; i < grid.length; i++)
  {
    for(int j = 0; j < grid.length; j++)
    {
      grid[i][j] = false;
    }
  }
  start = false;
}