require 'rails_helper'

describe 'Article Show Page' do
  before :each do
    @a1 = Article.create!(title: "Title 1", body: "Body 1")
    @a2 = Article.create!(title: "Title 2", body: "Body 2")
  end
  describe 'As A Visitor' do
    it 'should show the articles title and body' do
      visit "/articles/#{@a1.id}"

      expect(page).to have_content(@a1.title)
      expect(page).to have_content(@a1.body)

      expect(page).to_not have_content(@a2.title)
    end
  end
end