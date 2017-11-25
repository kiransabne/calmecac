class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.text :objectives, array: true, default: []

      t.timestamps
    end
  end
end
