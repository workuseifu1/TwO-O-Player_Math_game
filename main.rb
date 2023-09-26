require_relative 'MathGame'

def get_player_answer
  print "Enter your answer: "
  gets.chomp.to_i
end

def display_player_lives(players)
  players.each do |player|
    puts "#{player.name} has #{player.lives} lives left."
  end
end

def main
  game = MathGame.new
  players = game.players

  until game.game_over?
    game.generate_question
    player_answer = get_player_answer

    if game.check_answer(player_answer)
      puts "Correct!\n\n"
    else
      puts "Incorrect! You lose a life.\n\n"
      game.current_player.lose_life
    end

    display_player_lives(players)
    puts "\n----- NEW TURN -----\n\n"
    game.switch_player
  end

  game.announce_winner
end

main
