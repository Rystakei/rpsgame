class Game < ActiveRecord::Base
	attr_accessible :computer_signal, :user_signal
	before_save :score_game

	def score_game
		#The computer's hand signal is chosen by generating a number
		#between 0-2 randomly, and adding selecting the signal with the 
		#matching index
		signal_options = ['Rock', 'Paper', 'Scissors']
		self.computer_signal = signal_options[rand(0..2)]

		#The following loop determines if the user has won, lost, or tied
		#and sets the game's status accordingly.

		#The loop first checks if the conditions are met that would allow
		#the user to win.
		if self.user_signal == "Rock" && self.computer_signal == "Scissors"
			self.status = "won_by_user"
		elsif self.user_signal == "Scissors" && self.computer_signal == "Paper"
			self.status = "won_by_user"
		elsif self.user_signal == "Paper" && self.computer_signal == "Rock"
			self.status == "won_by_user"
		#The loop then checks to see if a tie has taken place.
		elsif self.user_signal == self.computer_signal
			self.status = "tied"
		#If none of the previous conditions have been met, the user
		#has lost the game.
		else
		self.status = "lost_by_user"
		end
	end
end
