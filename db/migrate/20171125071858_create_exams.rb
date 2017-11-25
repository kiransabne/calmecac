class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.text :description

      t.timestamps
    end
  end
end
