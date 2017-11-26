class AddUserIdToInscription < ActiveRecord::Migration[5.1]
  def change
    add_column :inscriptions, :user_id, :integer
  end
end
