## SCORE TO 10

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
	  @value = value
  end

  def scissors?
	  @value == 'scissors'
	end

	def rock?
	  @value == 'rock'
	end

	def paper?
	  @value == 'paper'
	end

	def lizard?
		@value == 'lizard'
	end

	def spock?
		@value == 'spock'
	end

	def >(other_move)
	  if rock?
		  return true if other_move.scissors? || other_move.lizard?
	  elsif paper?
	    return true if other_move.rock? || other_move.spock?
	  elsif scissors?
		  return true if other_move.paper? || other_move.lizard?
		elsif lizard?
			return true if other_move.paper? || other_move.spock?
		elsif spock?
			return true if other_move.rock? || other_move.scissors?
	  end
	  false
  end

  def <(other_move)
	  if rock?
		  return true if other_move.paper? || other_move.spock?
	  elsif paper?
		  return true if other_move.scissors? || other_move.lizard?
		elsif scissors?
		  return true if other_move.rock? || other_move.spock?
		elsif lizard?
			return true if other_move.scissors? || other_move.rock?
		elsif spock?
			return true if other_move.paper? || other_move.lizard?
	  end
	  false
  end

	def to_s
	  @value
	end
end

class Player
  attr_accessor :move, :name, :points

  def initialize
	  set_name
	  @points = 0
  end

  def add_point
  	@points += 1
  end
end

class Human < Player
  def set_name
	  n = ''
		  loop do
			  puts "What's your name"
			  n = gets.chomp
			  break unless n.empty?
			  puts "Sorry, must enter a value"
		  end
		self.name = n
  end

	def choose
		choice = nil
			loop do
				puts "Please choose rock, paper, scissors, lizard, or spock:"
				choice = gets.chomp
				break if Move::VALUES.include? choice
				puts "Sorry, invalid choice."
			end
			self.move = Move.new(choice)
	end
end

class Computer < Player
	def set_name
		self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
	end

	def choose
		self.move = Move.new(Move::VALUES.sample)
	end
end

class RPSGame
	attr_accessor :human, :computer

	def initialize
	  @human = Human.new
	  @computer = Computer.new
	end

	def display_welcome_message
		puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!"
	end

	def display_goodbye_message
		puts "Thanks for playing Rock, Paper, Scissors, Lizard, and Spock. Good bye!"
	end

	def display_round_winner
		puts "#{human.name} chose #{human.move}."
		puts "#{computer.name} chose #{computer.move}."

		if human.move > computer.move
			puts "#{human.name} won!"
			human.add_point
		elsif human.move < computer.move
			puts "#{computer.name} won!"
			computer.add_point
		else
			puts "It's a tie!"
		end

		puts "Human has #{human.points}. Computer has #{computer.points}"
	end

	def reset_scores
		human.points = 0
		computer.points = 0
	end

	def play_again?
	  answer = nil
	  loop do
		  puts "Would you like to play again?(y/n)"
		  answer = gets.chomp
		  break if ['y', 'n'].include? answer.downcase
		  puts "Sorry, must be y or n."
		end

	  return true if answer == 'y'
	  return false
	end

	def is_there_winner?
		human.points == 10 || computer.points == 10
	end

	def game_winner
		if human.points == 10
			puts "#{human.name} won!!"
			reset_scores
		elsif	computer.points == 10
			puts "#{computer.name} won!!"
			reset_scores
		end
	end

  def play
    display_welcome_message
		loop do
			loop do
				human.choose
		  	computer.choose
				display_round_winner
				if is_there_winner?
					game_winner
					break
				end
			end
		  break unless play_again?
		end
    display_goodbye_message
  end
end

RPSGame.new.play
