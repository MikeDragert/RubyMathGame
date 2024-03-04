class Player
  attr_reader :name, :lives
  PROMPT = ":  "

  def initialize(name, lives)
    @name=name
    @lives=lives
  end

  def getAnswer(question)
    @answer = nil
    puts question.getQuestionText(@name, PROMPT)
    @answer = getUserAnswer
    self.getAnswerText(question)
  end
  
  def isAlive
    return @lives > 0
  end

  private
  def getUserAnswer
    answer = Integer(gets) rescue false      
    while (!answer)
      puts '*** Enter a number dummy! ***'
      answer = Integer(gets) rescue false      
    end
    return answer
  end

  def getAnswerText(question)
    if (question.isCorrect(@answer))  
      puts "#{@name}#{PROMPT}YES! Good job math genious!"
      return
    end
    puts "#{@name}#{PROMPT}NO! One step closer to death!"
    @lives -= 1
  end
end
