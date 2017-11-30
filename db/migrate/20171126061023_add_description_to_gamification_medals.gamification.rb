class AddDescriptionToGamificationMedals < ActiveRecord::Migration[4.2]
  def change
    add_column :gamification_medals, :description, :text
  end
end
