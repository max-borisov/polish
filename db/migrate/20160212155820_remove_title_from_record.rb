class RemoveTitleFromRecord < ActiveRecord::Migration
  def change
    remove_column :records, :title, :string
  end
end
