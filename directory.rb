def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #gets the first name
  print "Student name => "
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
  print "County of Birth => "
  country = gets.chomp
  print "Evilness Rating => "
  evil_rating = gets.chomp
  print "Favourite hobbies => "
  hobbies = gets.chomp
    students << {name: name, cohort: :november, country: country,
    evil_rating: evil_rating, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    puts "Please enter the next student details or hit return if finished"
    print "Student name => "
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end

def print_standard(students)
  students.each_with_index do |student, index|
    puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print_standard(students)
print_footer(students)

def print_restricted(students)
  students.each_with_index do |student, index|
    if student[:name][0].capitalize == "N" && student[:name].length <= 11
      puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_until_loop(students)
count = 0
until count == students.count
  puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
  count += 1
end
end
