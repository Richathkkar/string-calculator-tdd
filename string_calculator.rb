class StringCalculator
	def add(input)
		return 0 if input.empty?
		input.to_i if !input.include?(",")
		input.split(",").map(&:to_i).sum
	end
end