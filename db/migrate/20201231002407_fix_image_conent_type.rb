class FixImageConentType < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :image_conent_type, :image_content_type
  end
end
