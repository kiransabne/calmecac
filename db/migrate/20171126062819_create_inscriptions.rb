class CreateInscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :inscriptions do |t|
      t.references :course
      t.boolean :assigned
      t.integer :status

      t.timestamps
    end
  end
end
