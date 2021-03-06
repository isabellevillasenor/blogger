require 'rails_helper'

describe 'Articles Index' do 
  before :each do 
    @a1 = Article.create!(title: "Title 1", body: "Body 1")
    @a2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe 'As A Visitor' do
    it 'displays all articles' do
      visit '/articles'

      expect(page).to have_content(@a1.title)

      expect(page).to have_content(@a2.title)
    end

    it 'should have links on every title' do
      visit '/articles'

      expect(page).to have_link("#{@a1.title}")
      expect(page).to have_link("#{@a2.title}")

      click_link("#{@a1.title}")
      expect(current_path).to eq("/articles/#{@a1.id}")
    end
  end
end