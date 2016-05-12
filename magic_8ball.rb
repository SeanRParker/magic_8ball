# Prompt user to ask a question or type quit to exit.
puts "Welcome to Magic 8 Ball"

def welcome_message
  puts """
  What would you like to know? \n
  Enter a yes or no question...
  or type 'quit' to leave. \n
  """
  @question = gets.chomp
  puts "Fine. I didn't want to talk anyway!" if @question == "quit" || @question == "QUIT"
  exit(0) if @question == "quit" || @question == "QUIT"
end

welcome_message

# Array of stored responses
@responses = [
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

def output
  # Randomizes response and stores it in a value
  answer = @responses.sample
  # Returns value to user
  puts """
  The answer to '#{@question}' is... \n#{answer}
  """
end

output

# Asks user if they'd like to ask another question (y/n)


# if no, quit. If yes, return to beginning and start over
def ask_again
  while true
    puts "Would you like to ask another question? (y/n)"
    again = gets.strip.downcase
    exit (0) if again == "n" || again == "no" || again == "NO" || again == "No"
    welcome_message
    output
    ask_again
  end
end

ask_again
