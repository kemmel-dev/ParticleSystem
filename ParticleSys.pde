/**
 * Can be called to create and render particle effects
 * @Author Kamiel de Visser
 */
static class ParticleSys
{
    // An ArrayList of the explosions currently going on
    static ArrayList<TileExplosion> tileExplosions = new ArrayList<TileExplosion>();

    /**
     * Creates a new explosion at a given position and adds it to the tileExplosions list
     * @param x the x-coördinate to center this explosion at
     * @param y the y-coördinate to center this explosion at
     * @color fragmentsColor the color the explosion particles will have
     */
    static public void createExplosionAt(int x, int y, color fragmentsColor)
    {
        tileExplosions.add(processingInstance.new TileExplosion(x, y, fragmentsColor));
    }

    /**
     * Renders the explosion effects
     */
    static public void renderExplosions()
    {
        for (TileExplosion tileExplosion : tileExplosions)
        {
            tileExplosion.moveFragments();
            tileExplosion.display();
        }
    }

    /**
     * Removes explosions from the list of explosions to render if they're over.
     */
    static public void removeExplosions()
    {
        // Check if there are explosions in the render list
        if (tileExplosions.size() > 0)
        {
            // Check which explosions need to be removed, if any.
            int index = 0;
            IntList indexesToRemove = new IntList();
            for (TileExplosion tileExplosion : tileExplosions)
            {
                if (tileExplosion.isExplosionOver())
                {
                    indexesToRemove.append(index);
                }
                index += 1;
            }

            // Loop backwards and remove the explosions which need to be removed
            for (int i = indexesToRemove.size() - 1; i >= 0; i--) {
                tileExplosions.remove(i);
            }
        }
    }
}