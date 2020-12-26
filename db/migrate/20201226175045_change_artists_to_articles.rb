class ChangeArtistsToArticles < ActiveRecord::Migration[5.2]
  def change
    rename_table :artists, :articles
  end
end
