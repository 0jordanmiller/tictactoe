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

  puts "   a     b     c
      |     |
1  #{s[0][0].checked_by}  |  #{s[1][0].checked_by}  |  #{s[2][0].checked_by}
 _____|_____|_____
      |     |
2  #{s[0][1].checked_by}  |  #{s[1][1].checked_by}  |  #{s[2][1].checked_by}
 _____|_____|_____
      |     |
3  #{s[0][2].checked_by}  |  #{s[1][2].checked_by}  |  #{s[2][2].checked_by}
      |     |     "
end

def validate_regex(input)
  false_regex = /[a-c][1-3]/.match?(input)
  unless false_regex
    while false_regex == false
      puts '\nlease input a valid coordinate (e.g. a1, b3): '
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
    input = validate_regex(input)
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

def check_winner(squares, player)
  winner = false

  inner_count = 0
  3.times do
    count_v = 0
    count_h = 0
    count_ldiag = 0
    count_rdiag = 0

    squares.each_with_index do |inner, i|
      inner.each do |square|
        count_v += 1 if square.checked_by == player
      end
      count_h += 1 if inner[inner_count].checked_by == player
      count_ldiag += 1 if inner[i].checked_by == player
      count_rdiag += 1 if inner[(i + 1) * -1].checked_by == player

      if count_h == 3 || count_ldiag == 3 || count_rdiag == 3 || count_v == 3
        winner = true
        break
      end
    end
    inner_count += 1
  end

  if winner == true
    output_board(squares)
    p "#{player} wins the game"
  end
  winner
end

def start_game
  turn = 1
  squares = create_square
  player = 'x'
  played = {}
  winner = false
  while turn <= 9 && winner == false
    output_board(squares)
    input = player_input(player, played)
    squares = squares.map do |outer|
      outer.map do |inner|
        if (inner.x == input[0][0]) && (inner.y == input[0][1])
          inner.checked_by = input[1]
          played[input[0]] = player
        end
        inner
      end
    end
    winner = check_winner(squares, player)
    puts 'Tie game' if turn == 9 && winner == false

    turn += 1
    player = change_player(player)
  end
  puts 'Game has ended'
end

start_game
