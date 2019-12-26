/**
 * Tile object to draw a map with.
 * @Author Kamiel de Visser
 */
class Tile
{
    private int x, y;
    private int w, h;
    private color fillColor;
    
    /**
     * Constructor for a Tile object
     * @param x the x coördinate
     * @param y the y coördinate
     * @param w the width
     * @param h the height
     * @param fillColor - the color of this tole
     */
    public Tile(int x, int y, int w, int h, color fillColor)
    {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.fillColor = fillColor;
    }

    /** 
     * Draws this tile object
     */
    public void display()
    {
        fill(fillColor);
        rect(x, y, w, h);
    }

    /**
     * Getter for color.
     * @return the color of this tile
     */
    public color getColor()
    {
        return fillColor;
    }
}
