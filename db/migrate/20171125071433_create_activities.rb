class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.text :description
      t.string :url
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
