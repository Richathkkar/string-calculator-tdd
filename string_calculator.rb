class StringCalculator
	def add(input)
		return 0 if input.empty?
		
		# Handle custom delimiter at the beginning of the string
		if input.start_with?("//")
	      delimiter = input[2]
	      input = input[4..-1]
	      input = input.gsub(delimiter, ",")
	    else
	      # Handle newline delimiter along with commas
	      input = input.gsub("\n", ",")
	    end

	    # Split by commas and sum up the numbers
	    numbers = input.split(",")
	    numbers = numbers.map(&:to_i)

	    # Check for negative numbers and raise an exception
	    negatives = numbers.select { |num| num < 0 }
	    if negatives.any?
	      raise "negative numbers not allowed #{negatives.join(', ')}"
	    end

	    numbers.select { |number| number <= 1000 }.sum # ignore numbers > 1000
	end
end