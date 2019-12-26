/**
 * Represents a fragment of a tile object
 * @Author Kamiel de Visser
 */
class TileFragment
{
    private float x, y, w;
    private float angle = 0;
    private PVector dir;
    private float velocity;

    /** 
     * Constructor for a TileFragment object
     * @param x the x coördinate
     * @param y the y coördinate
     * @param angle the angle of this fragment
     */
    public TileFragment(float x, float y, float angle)
    {
        this.x = x;
        this.y = y;
        this.angle = angle;
        velocity = TILE_WIDTH / 32;
        dir = new PVector(random(-1, 1), random(-1,1));
        w = TILE_WIDTH / 6;
    }

    /**
     * Moves this TileFragment object
     */
    public void move()
    {
        x += dir.x * velocity;
        y += dir.y * velocity;
    }

    /**
     * Displays this TileFragment object
     */
    public void display()
    {
        float cosAngle = cos(angle);
        // Push rotation matrix
        pushMatrix();
        // Apply the rotation
        translate(x, y);
        rotate(cosAngle);
        // Draw the fragment
        rect(0, 0, w, w);
        // Pop rotation matrix
        popMatrix();
    }

    /**
     * Sets the angle of this TileFragment object
     * @param angle the angle of this TileFragment object
     */
    public void setAngle(float angle)
    {
        this.angle = angle;
    }
}