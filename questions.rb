module MathGame
  class Questions
    attr_accessor :answer, :question
    def initialize
      @number1 = rand(1..20)
      @number2 = rand(1..20)
      @syms =  %w[+ - * /]
      @operator = @syms.sample
    end

    def createQuestion
      @question = "What is #{@number1} #{@operator} #{@number2} ?"
    end

    def evaluateAnswer
      @answer = gets.chomp.to_i
      case @operator
      when "+"
       @answer == @number1 + @number2

      when "-"
        @answer == @number1 - @number2

      when "*"
        @answer == @number1 * @number2

      when "/"
        @answer == @number1 / @number2

      end
    end


  end
end