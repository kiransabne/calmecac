class CreateBadgesAndUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :badges_and_users do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
