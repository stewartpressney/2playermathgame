require "pry"
require './player'
require './game'
require './questions'
require 'colorize'

  @game_on = true



  def player_setup (new_player)
    puts "#{new_player} please enter your name!"
    name = gets.chomp
    new_player = MathGame::Player.new(name)
    puts "Hey #{new_player.name}!"
    new_player
  end

  player1 = player_setup('Player1')

  player2 = player_setup('Player2')

  game = MathGame::Game.new.turn

  while @game_on

  question = MathGame::Questions.new

  #dictate alternating turns & ask question
  if game % 2 == 0
    current_player = player1
    puts "#{current_player.name} : #{p question.createQuestion}".blue
  else
    current_player = player2
      puts "#{current_player.name}: #{p question.createQuestion}".yellow
  end


  # Evaluate answer
  if question.evaluateAnswer
    puts "That's Correct!"
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    puts "------Next Turn------".red
    game += 1
  else
    puts "Wrong --> Lost a Life!!"
    current_player.wrong_answer
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    puts "------Next Turn------".red
    game += 1
  end

  #if someone dies
  if player1.lives === 0
    puts "Player 2 wins with a score of #{player2.lives}/3"
    puts "------Game Over------".red
    @game_on  = false
  end

  if player2.lives === 0
    puts "Player 1 wins with a score of #{player1.lives}/3"
    puts "------Game Over------".red
    @game_on  = false
  end
end