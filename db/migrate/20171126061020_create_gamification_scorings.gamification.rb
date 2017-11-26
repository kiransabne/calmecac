class CreateGamificationScorings < ActiveRecord::Migration[4.2]
  def change
    create_table :gamification_scorings do |t|
      t.references :task, index: true
      t.references :subjectable, polymorphic: true

      t.timestamps
    end

    add_index :gamification_scorings, [:subjectable_id, :subjectable_type], name: 'index_gamification_scorings_on_subjectable'
  end
end
