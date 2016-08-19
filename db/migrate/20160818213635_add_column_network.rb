class AddColumnNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :confirmed, :boolean
  end
end
