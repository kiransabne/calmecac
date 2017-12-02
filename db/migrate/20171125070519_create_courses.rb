class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, index: true
      t.text :description, index: true
      t.text :objectives, array: true, default: [], index: true, using: 'gin'
      t.jsonb :sections, array: true, default: [], index: true
      t.references :user
      
      t.timestamps
    end
  end
end
