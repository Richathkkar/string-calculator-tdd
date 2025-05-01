class StringCalculator
	def add(input)
		return 0 if input.empty?
		
		# Process the delimiters (either default or custom)
		current_delimiters = process_delimiters(input)
		
		# Remove the custom delimiter declaration from the input string
	    input = input.gsub(%r{//[^\n]+\n}, '')
	 
	    # Replace newlines with the first delimiter found in the input
	    input.gsub!("\n", current_delimiters.first)
	 
	    # Split using the delimiters and convert them to integers
	    numbers = input.split(Regexp.union(current_delimiters)).map(&:to_i)

	    # Check for negative numbers and raise an error if any are found
		negatives = numbers.select { |n| n < 0 }
		raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.any?

	    numbers.select { |number| number <= 1000 }.sum # ignore numbers > 1000
	end

	private

	def process_delimiters(input)
     	if input.start_with?('//')
	       # If custom delimiters are specified, check if there are multiple delimiters enclosed in square brackets
	       if input.match?(%r{//\[(.*?)\]\n})
	         input.scan(%r{\[(.*?)\]}).flatten # Extract all delimiters
	       else
	         [input.match(%r{//(.)\n})[1]] # Extract a single character delimiter if it's just one character
	       end
     	else
       		[','] # Default delimiter
     	end
	end
end