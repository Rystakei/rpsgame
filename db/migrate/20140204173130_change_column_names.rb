class ChangeColumnNames < ActiveRecord::Migration
  def change
  	rename_column :games, :user_signal, :sign
  	rename_column :games, :computer_signal, :computer_sign
  end
end
