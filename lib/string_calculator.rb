class StringCalculator
  def add(str)
    return 0 if str.strip.empty?

    str.strip!
    str = str.gsub("\\n", "\n")

    return 'Invalid input' if str.match?(/,\n|\n,/)

    delimiter = /,|\n/

    if str.start_with?("//")
      header, str = str.split("\n", 2)
      custom_delim = header[2..]
      delimiter = Regexp.escape(custom_delim)
    end

    numbers = str.split(/#{delimiter}/).map(&:to_i)
    negative_numbers = numbers.select { |num| num < 0 }

    if negative_numbers.any?
      raise "Negative numbers not allowed #{negative_numbers.join(',')}"
    end

    numbers.sum
  rescue => e
    return e.message
  end
end
