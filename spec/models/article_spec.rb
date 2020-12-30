require 'rails_helper'

describe Article do 
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'relationships' do
    it { should have_many(:comments) }
    it { should have_many(:tags).through(:taggings) }
  end

  describe 'instance methods' do
    describe '#tag_list' do
      it 'should turn associated tags into a string' do
        article = Article.create!(title: "King Gizzard", body: "Writes interesting sci-fi")
        article.tags.create(name: 'music')
        article.tags.create(name: 'sci-fi')
        
        expect(article.tag_list).to eq('music, sci-fi')
      end
    end
  end
end