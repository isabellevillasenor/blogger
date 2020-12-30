class Comment < ApplicationRecord
  belongs_to :article, dependent: :destroy
  validates_presence_of :author_name, :body
end