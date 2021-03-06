module Board
  def show_board(coordinate)
    array = Array.new(8) { Array.new(8) { ' ' } }
    y, x = coordinate
    array[x][y] = 'K' # '♘'
    puts <<~HEREDOC

         |---+---+---+---+---+---+---+---|
      7  | #{array[7].join(' | ')} |
         |---+---+---+---+---+---+---+---|
      6  | #{array[6].join(' | ')} |
         |---+---+---+---+---+---+---+---|
      5  | #{array[5].join(' | ')} |
         |---+---+---+---+---+---+---+---|
      4  | #{array[4].join(' | ')} |
         |---+---+---+---+---+---+---+---|      #{coordinate}
      3  | #{array[3].join(' | ')} |
         |---+---+---+---+---+---+---+---|
      2  | #{array[2].join(' | ')} |
         |---+---+---+---+---+---+---+---|
      1  | #{array[1].join(' | ')} |
         |---+---+---+---+---+---+---+---|
      0  | #{array[0].join(' | ')} |
         |---+---+---+---+---+---+---+---|
           0   1   2   3   4   5   6   7

    HEREDOC
  end
end
