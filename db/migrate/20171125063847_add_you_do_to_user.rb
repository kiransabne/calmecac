class AddYouDoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :you_do, :string
  end
end
