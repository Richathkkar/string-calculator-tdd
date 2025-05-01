class StringCalculator
	def add(input)
		return 0 if input.empty?
		
		# Handle newline delimiter along with comma
		input = input.gsub("\n", ",")
		numbers = input.split(",")
		numbers.map(&:to_i).sum
	end
end