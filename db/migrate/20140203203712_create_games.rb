class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :user_signal
      t.string :computer_signal

      t.timestamps
    end
  end
end
