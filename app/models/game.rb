class Game < ActiveRecord::Base
	attr_accessible :computer_sign, :sign
	before_save :score_game

	def score_game
		#The computer's hand signal is chosen by generating a number
		#between 0-2 randomly, and adding selecting the signal with the 
		#matching index
		signal_options = ['Rock', 'Paper', 'Scissors']
		self.computer_sign = signal_options[rand(0..2)]

		#The following loop determines if the user has won, lost, or tied
		#and sets the game's status accordingly.

		#The loop first checks if the conditions are met that would allow
		#the user to win.
		if self.sign == "Rock" && self.computer_sign == "Scissors"
			self.status = "User Won"
		elsif self.sign == "Scissors" && self.computer_sign == "Paper"
			self.status = "User Won"
		elsif self.sign == "Paper" && self.computer_sign == "Rock"
			self.status == "User Won"
		#The loop then checks to see if a tie has taken place.
		elsif self.sign == self.computer_sign
			self.status = "Tied"
		#If none of the previous conditions have been met, the user
		#has lost the game.
		else
		self.status = "User Lost"
		end
	end
end
