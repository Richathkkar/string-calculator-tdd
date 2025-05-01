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
	    numbers.map(&:to_i).sum
	end
end