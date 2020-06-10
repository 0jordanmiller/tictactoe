# frozen_string_literal: true

class Square
  attr_accessor :x, :y, :checked_by

  def initialize(x, y)
    @x = x
    @y = y
    @checked_by = '-'
  end
end

def create_square
  x = ('a'..'c').to_a
  y = %w[1 2 3]

  x.map do |x_cord|
    y.map do |y_cord|
      Square.new(x_cord, y_cord)
    end
  end
end

def output_board(squares)
  s = squares

  print "   a     b     c
      |     |
1  #{s[0][0].checked_by}  |  #{s[0][1].checked_by}  |  #{s[0][2].checked_by}
 _____|_____|_____
      |     |
2  #{s[1][0].checked_by}  |  #{s[1][1].checked_by}  |  #{s[1][2].checked_by}
 _____|_____|_____
      |     |
3  #{s[2][0].checked_by}  |  #{s[2][1].checked_by}  |  #{s[2][2].checked_by}
      |     |     "
end

def check_winner(squares, player)
  winner = false
  count = 0
  squares[0].each do |a_square|
    count += 1 if a_square.checked_by == player
  end
  winner = true if count == 3
  p "#{player} wins the game" if winner == true
end

def validate_regex(input)
  false_regex = /[a-c][1-3]/.match?(input)
  unless false_regex
    while false_regex == false
      print 'Please input a valid coordinate (e.g. a1, b3): '
      input = gets.chomp
      false_regex = /[a-c][1-3]/.match?(input)
    end
  end
  input
end

def valid_coordinate(input, played)
  
  while played.key?(input) == true
    print 'This coordinate has already been played, please choose another: '
    input = gets.chomp

  end
  input
end

def player_input(player, played)
  print "Please input a coordinate for player #{player}: "
  input = gets.chomp
  input = validate_regex(input)
  input = valid_coordinate(input, played)
  [input, player]
end

def change_player(player)
  if player == 'x'
    'o'
  else
    'x'
  end
end

def start_game
  turn = 0
  squares = create_square
  player = 'x'
  played = {}
  while turn <= 9
    output_board(squares)
    input = player_input(player, played)
    squares = squares.map do |outer|
      outer.map do |inner|
        if (inner.x == input[0][0]) && (inner.y == input[0][1])
        inner.checked_by = input[1]
        played[input[0]] = true
        end
        inner
      end
    end
    check_winner(squares, player)
    turn += 1
    player = change_player(player)
  end
end



start_game
