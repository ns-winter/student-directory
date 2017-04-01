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
  cohort_months = [:January, :February, :March, :April, :May, :June,
  :July, :August, :September, :October, :November, :December]
  print "Cohort Month =>"
  cohort = gets.chomp
  while !cohort_months.include? cohort.capitalize.to_sym
    puts "Please re-enter Cohort Month (in full)..."
    print "Cohort Month =>"
    cohort = gets.chomp
  end
  print "County of Birth => "
  country = gets.chomp
  print "Evilness Rating => "
  evil_rating = gets.chomp
  print "Favourite hobbies => "
  hobbies = gets.chomp
    students << {name: name, cohort: cohort.capitalize, country: country,
    evil_rating: evil_rating, hobbies: hobbies}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Please enter the next student details or hit return if finished"
    print "Student name => "
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  line_width = 50
  puts "The students of Villains Academy".center(line_width)
  puts "-----------------".center(line_width)
  puts
end

def print_standard(students)
  students.each_with_index do |student, index|
    puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  line_width = 50
  puts
  puts "-----------------".center(line_width)
  puts "Overall, we have #{students.count} great students".center(line_width)
  puts
  puts "----".center(line_width)
  puts "FIN!".center(line_width)
  puts "----".center(line_width)
end



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

def print_by_cohort(students)
  students.sort_by! { |student| student[:cohort] }
  count = 0
  until count == students.count
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

#nothing happens until we call the methods
=begin
students = input_students
if students.count == 0
  puts
  puts "No students attend Villains Academy :("
  puts
else
  print_header
  print_by_cohort(students)
  print_footer(students)
end
=end

def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_standard(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
