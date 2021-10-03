class AddAuthorToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :author_id, :integer
  end
end
