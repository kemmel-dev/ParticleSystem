
private final int NUM_TILES_X = 16;
private final int NUM_TILES_Y = 9;

private final int SIZE_X = 1920 / 2;
private final int SIZE_Y = 1080 / 2;

private final int TILE_WIDTH = SIZE_X / NUM_TILES_X;
private final int TILE_HEIGHT = SIZE_Y / NUM_TILES_Y;

private Tile[][] grid = new Tile[NUM_TILES_X][NUM_TILES_Y];

static ParticleSystem processingInstance;

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    rectMode(CENTER);
    initGrid();

    // Get a static reference to the instance of the 'main' class.
    processingInstance = this;
}

void draw()
{
    displayGrid();
    ParticleSys.renderExplosions();
    ParticleSys.removeExplosions();
}

public void initGrid()
{
    int dx = TILE_WIDTH;
    int xStart = dx / 2;
    int x = xStart;
    int dy = TILE_HEIGHT;
    int yStart = dy / 2;
    int y = yStart;
    
    for (int i = 0; i < grid.length; i++)
    {
        for (int j = 0; j < grid[i].length; j++)
        {
            grid[i][j] = new Tile(x, y, dx, dy, color(random(255),random(255),random(255)));
            y += dy;
        }
        y = yStart;
        x += dx;
    }
}

public void displayGrid()
{
    for (int i = 0; i < grid.length; i++)
    {
        for (int j = 0; j < grid[i].length; j++)
        {
            grid[i][j].display();
        }
    }
}

// Get the tile on a coord
public Tile getTileOnCoord(int x, int y)
{
    print("Mouse X: " + x, " Mouse Y: " + y + "\n");
    int xIndex = int(x / TILE_WIDTH);
    print("xIndex: " + xIndex + "\n");
    int yIndex = int(y / TILE_HEIGHT);
    print("yIndex: " + yIndex + "\n");
    return grid[xIndex][yIndex];
}

// When the mouse is pressed...
public void mousePressed()
{
    // ... get the color of the tile that the mouse is in
    color tileUnderMouseColor = getTileOnCoord(mouseX, mouseY).getColor();

    // create a particle explosion at the location of the mouse in that color
    fill(tileUnderMouseColor);
    ParticleSys.createExplosionAt(mouseX, mouseY, tileUnderMouseColor);
}






