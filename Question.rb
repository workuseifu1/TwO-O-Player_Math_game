class Question
  attr_accessor :num1, :num2

  def initialize
    generate_question
  end

  def generate_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def correct_answer
    @num1 + @num2
  end
end
