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
