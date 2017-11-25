class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :url
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
