
# def check_winner(squares, player)
#   winner = false
#   count = 0
#   squares[0].each do |a_square|
#     count += 1 if a_square.checked_by == player
#   end
#   winner = true if count == 3
#   p "#{player} wins the game" if winner == true
# end