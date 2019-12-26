class TileExplosion
{
    private int x, y;
    private int radius = TILE_WIDTH / 8;
    private color fragmentsColor;
    private int fragmentsOpacity;
    private TileFragment[] tileFragments = new TileFragment[4];

    private final int OPACITY_DECREASE_STEP = 5;

    private boolean explosionOver = false;

    public TileExplosion(int x, int y, color fragmentsColor)
    {
        this.x = x;
        this.y = y;
        this.fragmentsColor = fragmentsColor;
        fragmentsOpacity = 255;
        fillTileFragments();
    }

    public boolean isExplosionOver()
    {
        return explosionOver;
    }
    
    public void display()
    {
        fill(fragmentsColor, fragmentsOpacity);
        for (TileFragment tileFragment : tileFragments)
        {
            tileFragment.display();
        }
        fragmentsOpacity -= OPACITY_DECREASE_STEP;
        if (fragmentsOpacity <= 0)
        {
            explosionOver = true;
        }
    }

    public void moveFragments()
    {
        for (TileFragment tileFragment : tileFragments)
        {
            tileFragment.move();
        }
    }

    private void fillTileFragments()
    {
        for (int i = 0; i < tileFragments.length; i++)
        {
            int randX = getRandBetween(x - radius, x + radius);
            int randY = getRandBetween(y - radius, y + radius);
            int randAngle = getRandBetween(0, 360);
            tileFragments[i] = new TileFragment(randX, randY, randAngle);
        }
    }

    private int getRandBetween(int lowLim, int highLim)
    {
        return int(random(lowLim, highLim + 1));
    }
}