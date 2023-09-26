require_relative 'Player'
require_relative 'Question'
class MathGame
  attr_accessor :players

  def initialize
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @current_player = 0
  end

  def generate_question
    question = Question.new
    puts "#{current_player.name}: What is #{question.num1} + #{question.num2}?"
    @answer = question.correct_answer
  end

  def current_player
    @players[@current_player]
  end

  def switch_player
    @current_player = (@current_player + 1) % 2
  end

  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }
    loser = @players.find { |player| player.lives == 0 }
    puts "#{winner.name} wins with #{winner.lives} lives remaining!"
    puts "#{loser.name} scored #{3 - loser.lives} points."
  end

  def check_answer(player_answer)
    player_answer == @answer
  end

  def play
    until game_over?
      generate_question
      player_answer = gets.chomp.to_i

      if check_answer(player_answer)
        puts "Correct!\n\n"
      else
        puts "Incorrect! You lose a life.\n\n"
        current_player.lose_life
      end

      @players.each { |player| puts "#{player.name} has #{player.lives} lives left." }
      puts "\n----- NEW TURN -----\n\n"
      switch_player
    end
    announce_winner
  end
end




