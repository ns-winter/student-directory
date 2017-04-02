@students = []

def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice"
  #gets the first name
  print "Student name => "
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
  cohort_months = [:January, :February, :March, :April, :May, :June,
  :July, :August, :September, :October, :November, :December]
  print "Cohort Month => "
  cohort = STDIN.gets.chomp.capitalize
  while !cohort_months.include? cohort.capitalize.to_sym
    puts "Please re-enter Cohort Month (in full)..."
    print "Cohort Month => "
    cohort = STDIN.gets.chomp
  end
    add_students(name, cohort)
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "Please enter the next student details or hit return if finished"
    print "Student name => "
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save this list"
  puts "4. Load a list"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  line_width = 50
  puts "The students of Villains Academy".center(line_width)
  puts "-----------------".center(line_width)
  puts
  @students.each_with_index do |student, index|
    puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
  puts
  puts "-----------------".center(line_width)
    if @students.count == 0
      puts "No students attend Villains Academy so far :(".center(line_width)
      puts
    elsif @students.count == 1
      puts "We have one great student at Villains Academy".center(line_width)
    else
      puts "Overall, we have #{@students.count} great students".center(line_width)
      puts
    end
  puts
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "What file would you like to save this list to?"
      puts "WARNING: This will overwrite the file!"
      puts "Hit return to go back to main menu."
      filename = gets.chomp
      save_students(filename)
    when "4"
      puts "What file would you like to load?"
      filename = gets.chomp
        if filename.nil?
          load_students("students.csv")
        elsif File.exists?(filename) #if it exists
          load_students(filename)
            puts "Loaded #{@students.count} from #{filename}."
        else # if it doesn't exist
          puts
          puts "Sorry, #{filename} doesn't exist."
          puts
          interactive_menu
        end
    when "9"
      puts
      puts "BYE!"
      puts
      exit # this will cause the program to terminate
    else
      puts
      puts "I don't know what you meant, try again"
      puts
  end
end

def save_students(filename)
  # open the file for writing
  if filename.empty?
    interactive_menu
  else
    file = File.open(filename, "w")
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  file.close
  puts
  puts "Students saved"
  puts
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_students(name, cohort)
  end
  file.close
  puts
  puts "Students loaded"
  puts
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students("students.csv")
  elsif File.exist?(filename) #if it exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}."
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
