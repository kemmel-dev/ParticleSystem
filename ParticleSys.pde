static class ParticleSys
{
    static ArrayList<TileExplosion> tileExplosions = new ArrayList<TileExplosion>();

    static public void createExplosionAt(int x, int y, color fragmentsColor)
    {
        tileExplosions.add(processingInstance.new TileExplosion(x, y, fragmentsColor));
    }

    static public void renderExplosions()
    {
        for (TileExplosion tileExplosion : tileExplosions)
        {
            tileExplosion.moveFragments();
            tileExplosion.display();
        }
    }

    static public void removeExplosions()
    {
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

        for (int i = indexesToRemove.size() - 1; i >= 0; i--) {
            tileExplosions.remove(i);
        }

        print("Explosions: "+ tileExplosions.size() + "\n");
    }
}