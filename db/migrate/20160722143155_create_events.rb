class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :company, index: true
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end