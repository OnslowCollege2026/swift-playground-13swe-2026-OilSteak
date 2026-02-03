

class MazeBase
{ 
  /// Size of the maze.
  private var width: Int
  private var height: Int

  /// Stores the maze. Each cell is represented by a 4-bit value, where each bit represents
  /// whether a direction has a wall in it.
  ///  - North: Bit 1 (LSB)
  ///  - South: Bit 2
  ///  - East: Bit 3
  ///  - West: Bit 4 (MSB)
  private var mazeGrid: [[Int]]

  init(
    width: Int,
    height: Int
  ) 
  {
    self.width = width
    self.height = height
    
    var mazeGrid: [[Int]] = []
    for _ in 0..<height
    { 
      var newRow: [Int] = []

      for _ in 0..<width
      {
        newRow.append(0)
      }

      mazeGrid.append(newRow)
    }

    self.mazeGrid = mazeGrid
  }


  public func drawMaze() 
  {
    ///TODO Add code to print the maze.
    
    
  }
}