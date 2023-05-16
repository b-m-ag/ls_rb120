## Lizard and Spock
## Move History

require 'pry'
class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
	attr_accessor :value

	def initialize(value)
		@value = value
	end

	def scissors?
	  value == 'scissors'
	end

	def rock?
	  value == 'rock'
	end

	def paper?
	  value == 'paper'
	end

	def lizard?
		value == 'lizard'
	end

	def spock?
		value == 'spock'
	end

	def to_s
	  value
	end
end

class Rock < Move
	def >(other_move)
	  return true if other_move.scissors? || other_move.lizard? if rock?
	  false
  end

  def <(other_move)
	  return true if other_move.paper? || other_move.spock? if rock?
		false
  end
end

class Paper < Move
	def >(other_move)
	  return true if other_move.rock? || other_move.spock?
	  false
  end

  def <(other_move)
	  return true if other_move.scissors? || other_move.lizard?
		false
  end
end

class Scissors < Move
	def >(other_move)
	  return true if other_move.paper? || other_move.lizard?
	  false
  end

  def <(other_move)
	  return true if other_move.rock? || other_move.spock?
		false
  end
end

class Lizard < Move
	def >(other_move)
	  return true if other_move.paper? || other_move.spock?
		false
  end

  def <(other_move)
	  return true if other_move.scissors? || other_move.rock?
		false
  end
end

class Spock < Move
	def >(other_move)
	  return true if other_move.rock? || other_move.scissors?
		false
  end

  def <(other_move)
	  return true if other_move.paper? || other_move.lizard?
		false
  end
end

class Player
  attr_accessor :move, :name, :points, :past_moves

  def initialize
	  @points = 0
		@past_moves = []
  end

  def add_point
  	@points += 1
  end

	def move_assignment(input)
		choice = ''
		case input
		when 'rock'
			choice = Rock.new(input)
		when 'paper'
			choice = Paper.new(input)
		when 'scissors'
			choice = Scissors.new(input)
		when 'lizard'
			choice = Lizard.new(input)
		when 'spock'
			choice = Spock.new(input)
		end
		choice
	end
end

class Human < Player
	def initialize
		super
		set_name
	end

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
		choice = ''
			loop do
				puts "Please choose rock, paper, scissors, lizard, or spock:"
				choice = gets.chomp
				break if Move::VALUES.include? choice
				puts "Sorry, invalid choice."
			end
			self.move = move_assignment(choice)
			self.past_moves << self.move
	end
end

class Computer < Player
	def initialize
		super
	end
end

class R2D2 < Computer
	def initialize
		super
		@name = 'R2D2'
	end

	def choose
		self.move = move_assignment('rock')
		self.past_moves << self.move
	end
end

class Hal < Computer
	MOVES = ['scissors', 'scissors', 'scissors', 'scissors', 'rock']
	def initialize
		super
		@name = 'Hal'
	end

	def choose
		self.move = move_assignment(MOVES.sample)
		self.past_moves << self.move
	end
end

class RPSGame
	attr_accessor :human, :computer

	def initialize
	  @human = Human.new
	  @computer = select_cpu
	end

	def select_cpu
		pers = ['R2D2', 'Hal'].sample
		case pers
		when 'R2D2'
			cpu = R2D2.new
		when 'Hal'
			cpu = Hal.new
		end
		cpu
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

	def show_past_moves
		(0..human.past_moves.length - 1).to_a.each do |n|
			puts "#{human.name}: #{human.past_moves[n]} | #{computer}#{computer.past_moves[n]}"
		end
	end

  def play
    display_welcome_message
		loop do
			loop do
				human.choose
		  	computer.choose
				system"clear"
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
