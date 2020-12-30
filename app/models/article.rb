class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates_presence_of :title, :body

  def tag_list
    self.tags.collect do |t|
      t.name
    end.join(", ")
  end
  
end