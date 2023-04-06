class AddAuthorToComics < ActiveRecord::Migration[7.0]
  def change
    add_reference :comics, :author
  end
end
