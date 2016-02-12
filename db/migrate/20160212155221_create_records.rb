class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
