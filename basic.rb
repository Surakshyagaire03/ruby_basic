# Assignment-1 (Conditionals and Loops)
# Write a Ruby program where:
# The program asks the user to guess a secret number between 1 and 20.
# The program keeps asking until the user guesses correctly.
# Use conditionals to give hints:
# If the guess is too high → print "Too high! Try again."
# If the guess is too low → print "Too low! Try again."
# If the guess is correct → print "Congratulations! You guessed it!" and stop the loop.

secret_number = 13

loop do
  print "Guess the number: "
 guess = gets.to_i    #takes user input and converts it into an integer

 case
  when guess > secret_number
    puts "Too high! Please try again."
  when guess < secret_number
    puts "Too low!  Please try again."
  else
    puts "Congratulations! You guessed it!"
    break
  end
end

