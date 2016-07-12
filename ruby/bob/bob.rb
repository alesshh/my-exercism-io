class Bob
  def hey(question)
    case
    when question.strip.empty?
      'Fine. Be that way!'
    when question.upcase == question && question.downcase != question
      'Whoa, chill out!'
    when question.end_with?('?')
      'Sure.'
    else
      'Whatever.'
    end
  end
end
