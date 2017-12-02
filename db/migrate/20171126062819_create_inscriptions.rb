class CreateInscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :inscriptions do |t|
      t.references :course
      t.references :user
      t.boolean :assigned, default: false
      t.integer :status, default: 0
      t.jsonb :sections, default: {}, index: true

      t.timestamps
    end
  end
end
