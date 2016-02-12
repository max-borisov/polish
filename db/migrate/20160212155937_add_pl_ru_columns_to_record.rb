class AddPlRuColumnsToRecord < ActiveRecord::Migration
  def change
    add_column :records, :pl, :string, null: false
    add_column :records, :ru, :string, null: false
  end
end
