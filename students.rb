students = []
eye_colors = []
ages = []
heights = []
blood_types = []

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
	height = (info[3].strip.to_i * 12) + info[4].strip.to_i
	heights.push(height)
	blood_types.push(info[5].strip)
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

def num_of_vowels(string)
	vowels = 0 
	string.chars.each do |char|
		if is_vowel?(char)
			vowels += 1
		end
	end
	return vowels
end

def is_vowel?(char)
	return char.downcase == "a" || char.downcase == "e" || char.downcase == "i" || char.downcase == "o" || char.downcase == "u" 
end

def sophomore_vowels(students, ages)
	most_vowels = students[0]
	max_vowels = 0
	students.each_with_index do |current_name, i|
		vowels = 0
		if ages[i] == 15
			vowels = num_of_vowels(current_name)
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

def average_height(heights)
	sum = 0
	heights.each do |height|
		sum += height
	end
	return (sum.to_f / heights.length)
end

puts "What is the average height of the students in inches?"
puts average_height(heights)

def in_array(array, check_value)
	array.each do |value|
		if value == check_value
			return true
		end
	end
	return false
end

def blood_donation(students, blood_types, student_name)
	student = 0
	donors = []
	student_type = ""
	students.each_with_index do |student, i|
		if student == student_name
			student_type = blood_types[i]
		end
	end
	avalible_types = []
	if student_type == "A"
		avalible_types = ["A", "AB"]
	elsif student_type == "B"
		avalible_types = ["B", "AB"]
	elsif student_type == "O"
		avalible_types = ["A", "B", "O", "AB"]
	elsif student_type == "AB"
		avalible_types = ["AB"]
	end
	blood_types.each_with_index do |type, i|
		if in_array(avalible_types, type)
			donors.push(students[i])
		end
	end
	return donors
end

puts "Which people can donate blood to a secific student given their blood type?"
puts blood_donation(students, blood_types, "Wendy")

def most_blood(students, blood_types)
	max_donors = 0
	highest_donor_round_1 = ""
	highest_donors = []
	
	students.each_with_index do |student_name, i|
		donors = blood_donation(students, blood_types, student_name)
		if donors.length > max_donors
			max_donors = donors.length
			highest_donor_round_1 = student_name
		end
	end

	highest_donors.push(highest_donor_round_1)
	students.each_with_index do |student_name, i|
		donors = blood_donation(students, blood_types, student_name)
		if donors.length == max_donors
			if student_name != highest_donor_round_1
				highest_donors.push(student_name)
			end
		end
	end
	
	return highest_donors, max_donors
end

puts "Which student has the highest number of donors, and how many?"
puts most_blood(students, blood_types)

def average_green_eyed_girls(students, ages, eye_colors)
	greenEyedGirls = []
	sum = 0
	eye_colors.each_with_index do |color, i|
		if color == "Green"
			greenEyedGirls.push(students[i])
			sum += ages[i] 
		end
	end
	average = sum.to_f / (greenEyedGirls.length)
	return average
end

puts "What is the average age of the green eyed students?"
puts average_green_eyed_girls(students, ages, eye_colors)