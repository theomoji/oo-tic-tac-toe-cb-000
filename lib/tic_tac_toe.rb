class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row  Horizonals
    [3,4,5], #Middle row
    [6,7,8], #Bottom row

    [0,3,6], #Verticals
    [1,4,7],
    [2,5,8],

    [0,4,8],
    [2,4,6]
  ]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(user_input)
     user_input.to_i - 1
   end


     def move(index, value)
       @board[index] = value
     end

     def position_taken? (index)
        if @board[index] == ' ' || @board[index] == '' || @board[index] == nil
         false
        else
          true
        end
      end

      # def valid_move?(index)  # code your #valid_move? method here
      #   !position_taken?(index) &&  @board[index] - not checking anything
      # end


      def valid_move?(index)
         !position_taken?(index) && index.between?(0, 8)
       end

def turn_count
  count = 0
  @board.each do | position |
    if position != ' '
      count += 1
    end
  end
  return count
end

  def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
  end

  def turn
    print "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    value = current_player
    if valid_move?(index)
      move(index, value)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
    @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
  end
  end


  def full?
    @board.none? do |i|
      i == " " || i.nil?
    end
  end

  def draw?
    won? == nil && full? == true
  end

  def over?
    draw? == true || won? != nil
  end

  def winner
    if won?
      winner = @board[won?[0]]  #setting winner a variable. Inconsequencial as winner won't be used in the future.
    end
  end

  def play
    until over? do
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
