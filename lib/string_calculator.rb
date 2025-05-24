require 'pry'
class StringCalculator
  def add(str)
    return 0 if str.strip.empty?
    raise 'Invalid input' if str.include?('\n') && str.match?(/\d,\\n/m)
    str = str.gsub(' ', '')

    str.split(',').map(&:to_i).sum
    rescue => e
      e.message
  end
end

StringCalculator.new.add('1\n2,3')