require "pry"
# Array of stored responses
@responses_array = [
  "You would ask that wouldn't you?",
  "Probably",
  "Never.",
  "OK but just this one time.",
  "Fine... Absolutely!",
  "Hahaha. No.",
  "Ummm, no.",
  "Ask again later (and not just 2 seconds from now you jerk).",
  "Error. Bad user. Have someone else ask the question.",
  "If you have to ask, you already know the answer.",
  "I can't believe you'd ask that!",
  "Don't you have some work to do?",
  "Outlook not good",
  "Absolutely!",
  "Why do you care?",
  "Bite me.",
  "Survey says no",
  "You do realize you're asking a machine right? How did things get this low?",
  "Ummmm. Sure. Why not?",
  "You'll never know unless you try.",
  "Never.",
  "OK. Yeah.",
  "What do you want me to say? Ummm.... yes?",
  "Of course, but who isn't?",
  "Absotively Posilutely",
  "You win. Sure."
]

# Add a question
def easter_eggs
  while true
    puts "Welcome to the secret menu!!"
    puts "1) Add a new response"
    puts "2) Reset response array"
    puts "3) See available responses"
    puts "4) Return to main menu"
    easter_input = gets.chomp
    case
      when easter_input == "1"
        puts "add response:"
        new_answer = gets.strip
        @responses << "#{new_answer}"
        easter_eggs
      when easter_input == "2"
        @responses.clear
        @responses = @responses_array.clone
        easter_eggs
      when easter_input == "3"
        puts @responses.join("\n")
        easter_eggs
      when easter_input == "4"
        welcome_message
      break if easter_input == "4"
    end
  end
end

@responses = @responses_array.clone

# Prompt user to ask a question or type quit to exit.
puts "Welcome to Magic 8 Ball"


# secret commands

def secret_commands
  # Add an answer to the array
  if @question == "add_answers"
    puts "add response:"
    answer_to_add = gets.chomp
    @responses.insert(@responses.length, answer_to_add)
    # Reset responses array if user types reset_answers
  elsif @question == "reset_answers"
    @responses.clear
    @responses = @responses_array.clone
    # print responses if user types print_answers using .join
  elsif @question == "print_answers"
    puts @responses.join("\n")
  else
    ask_again
  end
end

def output
  if @question == "print_answers" || @question == "reset_answers" || @question == "add_answers"
    secret_commands
  else
    # Randomizes response and stores it in a value
    answer = @responses.sample
    # binding.pry
    # Returns value to user
    puts """
    The answer to '#{@question}' is... #{answer}
    """
  end
end

def welcome_message
  puts """
  What would you like to know? \n
  Enter a yes or no question...
  or type 'quit' to leave. \n
  """
  @question = gets.chomp
  # binding.pry

  if @question == "quit" || @question == "QUIT" || @question == "Q" || @question == "q"
    puts "Fine. I didn't want to talk anyway!"
    exit(0)
  elsif @question == "is this the real life?"
    easter_eggs
  elsif @question == "add_answers" || @question == "reset_answers" || @question == "print_answers"
    secret_commands
  else
    output
  end
end

# Asks user if they'd like to ask another question (y/n)
# if no, quit. If yes, return to beginning and start over
def ask_again
  while true
    puts "Would you like to ask another question? (y/n)"
    again = gets.strip.downcase
    puts "Thanks for using Magic 8 ball." if again == "n" || again == "no" || again == "NO" || again == "No"
    exit (0) if again == "n" || again == "no" || again == "NO" || again == "No"
    welcome_message
    ask_again
  end
end

welcome_message
ask_again
