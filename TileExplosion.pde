/**
 * A tile explosion shows fragments of the tile flying away.
 * @Author Kamiel de Visser
 */ 
class TileExplosion
{
    private int x, y;
    private int radius = TILE_WIDTH / 8;
    private color fragmentsColor;
    private int fragmentsOpacity;
    private TileFragment[] tileFragments = new TileFragment[4];

    private final int OPACITY_DECREASE_STEP = 5;

    private boolean explosionOver = false;
    
    /** 
     * Constructor for a TileExplosion object
     * @param x the x coördinate
     * @param y the y coördinate
     * @param fragmentsColor the color of the fragments that will fly away
     */
    public TileExplosion(int x, int y, color fragmentsColor)
    {
        this.x = x;
        this.y = y;
        this.fragmentsColor = fragmentsColor;
        fragmentsOpacity = 255;
        initTileFragments();
    }

    /**
     * @return whether the explosion is over
     */
    public boolean isExplosionOver()
    {
        return explosionOver;
    }
    
    /**
     * Show the tile fragments of this tile explosion
     * and decrease their opacity untill the explosion
     * is over
     */
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

    /**
     * Move the tile fragments of this tile explosion
     */
    public void moveFragments()
    {
        for (TileFragment tileFragment : tileFragments)
        {
            tileFragment.move();
        }
    }

    /**
     * Fill this explosion's array of fragments
     * with randomly placed fragments at a random angle
     */
    private void initTileFragments()
    {
        for (int i = 0; i < tileFragments.length; i++)
        {
            int randX = getRandBetween(x - radius, x + radius);
            int randY = getRandBetween(y - radius, y + radius);
            int randAngle = getRandBetween(0, 360);
            tileFragments[i] = new TileFragment(randX, randY, randAngle);
        }
    }

    /** 
     * Gets a random int between (inclusive of) the low and high limit
     * @param lowLim the lower limit
     * @param highLim the higher limit
     * @return a random int between and including the low and high limit
     */
    private int getRandBetween(int lowLim, int highLim)
    {
        return int(random(lowLim, highLim + 1));
    }
}