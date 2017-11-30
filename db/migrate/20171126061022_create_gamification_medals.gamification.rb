class CreateGamificationMedals < ActiveRecord::Migration[4.2]
  def change
    create_table :gamification_medals do |t|
      t.references :task, index: true
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
