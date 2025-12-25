# Assignment -1:
# Design and implement a small library management system using object-oriented programming (OOP) principles.

# Rules and Constraints
# Use attr_accessor for attribute access.
# The borrowed_books collection must not be accessed directly from outside the Member class.
# Use inheritance to create a PremiumMember from Member.
# Use method overriding to change borrowing limits.
# Use one class variable to track shared data across objects.
# Classes to Implement (3 Classes)

# 1. Book
# Represents a book in the library.
# Attributes: title, author, isbn, is_available (boolean)
# Methods:
# check_out → marks the book as unavailable
# return_book → marks the book as available
# to_s → returns a string representation of the book

# 2. Member
# Represents a library member.
# Attributes: name, member_id
# Private: borrowed_books (array of books borrowed by the member)
# Class Variable: @@total_members → stores the total number of members created
# Methods:
# borrow(book) → allows a member to borrow a book (maximum of 3 books)
# return(book) → returns a borrowed book
# list_books → lists all borrowed books
# self.total_members → returns the total number of members

# 3. PremiumMember < Member
# Represents a premium library member.
# Inherits from Member
# Overrides the borrow method to allow borrowing up to 5 books
# Tasks
# Implement the three classes in Ruby following the rules above.
# Create at least 5 books and 5 members (one regular, one premium).
# Demonstrate borrowing and returning books.
# Print out the list of borrowed books for each member.
# Print the total number of members created.


# class named book
class Book
  attr_accessor :title, :author, :isbn, :is_available

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @is_available = true
  end

  def check_out
    @is_available = false
  end

  def return_book
    @is_available = true
  end

  def to_s  #returns book details as a string.
    "#{title} by #{author} (ISBN: #{isbn})"
  end
end


# Class named member
class Member
  attr_accessor :name, :member_id

  @@total_members = 0   #all member share this class variablee

  def initialize(name, member_id)
    @name = name
    @member_id = member_id
    @borrowed_books = []
    @@total_members += 1
  end

  def borrow(book)
    if @borrowed_books.length >= 3 # borrowing limit check
      puts "#{name} cannot borrow more than 3 books."
    elsif !book.is_available
      puts "Book is not available."
    else
      @borrowed_books << book
      book.check_out
      puts "#{name} borrowed '#{book.title}'."
    end
  end

  def return(book)
    if @borrowed_books.include?(book)
      @borrowed_books.delete(book)
      book.return_book
      puts "#{name} returned '#{book.title}'."
    else
      puts "#{name} did not borrow this book."
    end
  end

  def list_books
    puts "Books borrowed by #{name}:"
    if @borrowed_books.empty?
      puts "No books borrowed."
    else
      @borrowed_books.each do |book|
        puts "- #{book}"
      end
    end
  end

  def self.total_members
    @@total_members
  end

  private
  def borrowed_books
    @borrowed_books
  end
end

# PremiumMember Class
class PremiumMember < Member
  def borrow(book)
    if @borrowed_books.length >= 5
      puts "#{name} cannot borrow more than 5 books."
    elsif !book.is_available
      puts "Book is not available."
    else
      @borrowed_books << book
      book.check_out
      puts "#{name} (Premium) borrowed '#{book.title}'."
    end
  end
end

# Books
b1 = Book.new("Atomic Habits", "James clear", "205")
b2 = Book.new("Rich Dad Poor Dad", "Robert T. Kiyosaki", "206")
b3 = Book.new("Think and Grow Rich", "Napoleon Hill", "207")
b4 = Book.new("You Can Win", "Shiv Khera", "208")
b5 = Book.new("The Power of Positive Thinking", "Norman Vincent Peale", "209")

# Members
m1 = Member.new("Surakshya", 1)
m2 = Member.new("Prakriti", 2)
m3 = Member.new("Samikshya", 3)
m4 = Member.new("Asmita", 4)
m5 = PremiumMember.new("Seema", 5)

# Borrow Books
m1.borrow(b1)
m1.borrow(b2)
m1.borrow(b3)

m5.borrow(b4)
m5.borrow(b5)

m1.return(b2)  # Return Book

# List Borrowed Books
m1.list_books
m5.list_books

puts "Total members created: #{Member.total_members}" # Total Members


