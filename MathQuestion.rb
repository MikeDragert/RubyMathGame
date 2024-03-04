class MathQuestion
  MAX = 20
  @number1 = 0
  @number2 = 0
  @answer = 0

  def initialize()
    makeQuestion
  end
  
  def getQuestionText(playerName, prompt)
    return ("#{playerName}#{prompt}What does #{@number1} plus #{@number2} equal?")
  end

  def isCorrect(answer)
    @answer == answer
  end

  private 
  
  def randomNumber(max)
    rand(1..max)
  end

  def makeQuestion()
    @number1 = self.randomNumber(MAX)
    @number2 = self.randomNumber(MAX)
    @answer = @number1 + @number2
  end

end