
private final int NUM_TILES_X = 16;
private final int NUM_TILES_Y = 9;

private final int SIZE_X = 1920 / 2;
private final int SIZE_Y = 1080 / 2;

private final int TILE_WIDTH = SIZE_X / NUM_TILES_X;
private final int TILE_HEIGHT = SIZE_Y / NUM_TILES_Y;

private Tile[][] grid = new Tile[NUM_TILES_X][NUM_TILES_Y];

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    rectMode(CENTER);
    initGrid();
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

public Tile getTileOnCoord(int x, int y)
{
    print("Mouse X: " + x, " Mouse Y: " + y + "\n");
    int xIndex = int(x / TILE_WIDTH);
    print("xIndex: " + xIndex + "\n");
    int yIndex = int(y / TILE_HEIGHT);
    print("yIndex: " + yIndex + "\n");
    return grid[xIndex][yIndex];
}

void draw()
{
    for (int i = 0; i < grid.length; i++)
    {
        for (int j = 0; j < grid[i].length; j++)
        {
            grid[i][j].display();
        }
    }
}

void mousePressed()
{
    getTileOnCoord(mouseX, mouseY);
}

class Tile
{
    int x, y;
    int w, h;
    color fillColor;

    Tile(int x, int y, int w, int h, color fillColor)
    {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.fillColor = fillColor;
    }

    void display()
    {
        fill(fillColor);
        rect(x, y, w, h);
    }

    public color getColor()
    {
        return fillColor;
    }
}

static class ParticleSys
{

}