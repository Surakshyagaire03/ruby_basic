# Assignment-1:
# Create a simple Ruby program that allows a user to enter a student’s name and view their details (roll number, age, marks, total, and average). This assignment will help you practice arrays, hashes, iteration, conditionals, and user input handling.
# Requirements
# Student Data
# Store student information (roll, name, age) in an array of hashes.
# Store marks for each student in a separate hash, keyed by roll number.
# User Interaction
# Display a welcome message.
# Prompt the user to enter a student’s name.
# Search Logic
# Iterate through the student list.
# If the name matches (case-insensitive), display:
# Student’s name and age
# Their marks in each subject
# Total marks
# Average marks (rounded to 2 decimal places)
# Error Handling
# If no student is found, display "Student not found."


# Information of the students array
students = [
    { roll: 1, name: "surakshya", age: 16},
    { roll: 2, name: "prakriti", age: 15},
    { roll: 3, name: "samikshya", age: 17},
    { roll: 4, name: "salina", age: 16},
    { roll: 5, name: "seema", age: 17},
]

# marks hash by key roll no
marks = {
    1 => { DSA:85, C:78, DigitalLogic:92, Probability:88, Microprocessor:78},
    2 => { DSA:65, C:75, DigitalLogic:88, Probability:82, Microprocessor:73},
    3 => { DSA:58, C:69, DigitalLogic:80, Probability:89, Microprocessor:68},
    4 => { DSA:66, C:59, DigitalLogic:72, Probability:79, Microprocessor:61},
    5 => { DSA:74, C:62, DigitalLogic:79, Probability:68, Microprocessor:56},

}

puts "WELCOM TO STUDENT INFORMATION OF RADIANT COLLEGE"
print "Enter the student name: "
input_name = gets.chomp.downcase #  chomp removes the newline


# search
found = false

students.each do |student|
  if student[:name].downcase == input_name
    found = true
    student_roll = student[:roll]

    puts "Student Details:"
    puts "Name: #{student[:name]}"
    puts "Age: #{student[:age]}"

    puts "Marks:"
    total_marks = 0  #variable initilization

    marks[student_roll].each do |subject, mark|
      puts "#{subject}: #{mark}"
      total_marks += mark
    end

    average = (total_marks.to_f / marks[student_roll].size).round(2)

    puts "Total Marks: #{total_marks}"
    puts "Average Marks: #{average}"
  end
end

puts "Sorry!Student not found." unless found

