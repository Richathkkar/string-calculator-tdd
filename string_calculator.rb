class StringCalculator
	def add(input)
		return 0 if input.empty?
		
		# Handle custom delimiter at the beginning of the string
		if input.start_with?("//")
		  delimiter_section, input = input.split("\n", 2)

		  if delimiter_section.match?(/\[.*\]/)
		    # Handle delimiter(s) of any length in square brackets
		    delimiters = delimiter_section.scan(/\[(.*?)\]/).flatten
		    delimiters.each do |delim|
		      input = input.gsub(delim, ",")
		    end
		  else
		    delimiter = delimiter_section[2]
		    input = input.gsub(delimiter, ",")
		  end
		end

	    input = input.gsub("\n", ",")
		numbers = input.split(",").map(&:to_i)
		negatives = numbers.select { |n| n < 0 }
		raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.any?

	    numbers.select { |number| number <= 1000 }.sum # ignore numbers > 1000
	end
end