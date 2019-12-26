class TileFragment
{
    private float x, y, w;
    private float angle = 0;
    private PVector dir;
    private float velocity;

    public TileFragment(float x, float y, float angle)
    {
        this.x = x;
        this.y = y;
        this.angle = angle;
        velocity = TILE_WIDTH / 32;
        dir = new PVector(random(-1, 1), random(-1,1));
        w = TILE_WIDTH / 6;
    }

    public void move()
    {
        x += dir.x * velocity;
        y += dir.y * velocity;
    }

    public void display()
    {
        float cosAngle = cos(angle);
        pushMatrix();
        translate(x, y);
        rotate(cosAngle);
        rect(0, 0, w, w);
        popMatrix();
    }

    public void setAngle(float angle)
    {
        this.angle = angle;
    }
}