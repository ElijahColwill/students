students = []
eye_colors = []
ages = []

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
end

def brown_eyes(eye_colors)
	num = 0
	eye_colors.each do |color|
		if color == "Brown"
			num += 1
		end
	end
	return num
end

puts "How many students have brown_eyes?"
puts brown_eyes(eye_colors)

def can_drive(students, ages)
	who_can_drive = []
	ages.each_with_index do |age, i|
		if age > 15
			who_can_drive.push(students[i].strip)
		end
	end
	return who_can_drive
end

puts "Which students can drive?"
puts can_drive(students, ages)

def green_eyed_girls(students, eye_colors)
	green_eyed_girls_array = []
	eye_colors.each_with_index do |color, i|
		if not i.odd?
			if color == "Green"
				green_eyed_girls_array.push(students[i].strip) 
			end
		end
	end
	return green_eyed_girls_array
end

puts "Which girls have green eyes?"
puts green_eyed_girls(students, eye_colors)

def sophomore_vowels(students, ages)
	most_vowels = students[0]
	max_vowels = 0
	students.each_with_index do |current_name, i|
		vowels = 0
		if ages[i] == 15
			current_name.chars.each do |char|
				if char.downcase == "a" || char.downcase == "e" || char.downcase == "i" || char.downcase == "o" || char.downcase == "u" 
					vowels += 1
				end 
			end
			if vowels > max_vowels
				max_vowels = vowels
				most_vowels = current_name
			end
		end
	end
	return most_vowels
end

puts "Which sophomore has the most vowels in their name?"
puts sophomore_vowels(students, ages)