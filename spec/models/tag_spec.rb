require 'rails_helper'

describe Tag do
  describe 'relationships' do
    it { should have_many(:taggings) }
    it { should have_many(:articles).through(:taggings) }
  end

  describe 'instance methods' do
    it '#to_s' do
      article = Article.create(title: "Tall Tables", body: "They are tough for the short legged")
      article.tags.create(name: "furniture")
      article.tags.create(name: "opinions")

      expect(Tag.first.to_s).to eq("furniture")
    end
  end
end