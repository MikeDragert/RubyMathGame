require "./Player.rb"
require "./MathQuestion.rb"

class Game
  MAXLIVES = 3

  def initialize()
    @players = [Player.new("Player 1", MAXLIVES), Player.new("Player 2", MAXLIVES)]
    @player = -1;
  end

  def runGame
    showStartMessage
    while (continueGame)
      advancePlayer
      askNextQuestion
    end
    finishGame
  end
  
  private
  
  def finishGame
    if (@players[0].isAlive)
      showGameDoneMessage(@players[0],@players[1])
    else
      showGameDoneMessage(@players[1],@players[0])
    end
  end

  def continueGame
    @players[0].isAlive() && @players[1].isAlive()
  end

  def askNextQuestion
    @players[@player].getAnswer(MathQuestion.new)
  end

  def advancePlayer
    if (@player == 1) 
      printScore
      printNewTurn
      @player = 0
    elsif (@player == 0)
      @player = 1
    else
      @player = 0
    end
  end

  def showStartMessage
    puts 'Let the math battle begin!'
  end

  def showGameDoneMessage(winner, loser)
    puts "************ GAME OVER ************"
    printScore
    puts "We have a winner! Congrats #{winner.name}"
    puts "#{loser.name}... you ded."
    puts "***********************************"
  end

  def printScore
    puts "#{@players[0].name}: #{@players[0].lives}/#{MAXLIVES} vs. #{@players[1].name}: #{@players[1].lives}/#{MAXLIVES} "
  end

  def printNewTurn
    puts "----- NEW TURN -----"
  end
end

game = Game.new
game.runGame