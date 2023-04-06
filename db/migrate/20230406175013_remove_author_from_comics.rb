class RemoveAuthorFromComics < ActiveRecord::Migration[7.0]
  def change
    remove_column :comics, :author, :string
  end
end
