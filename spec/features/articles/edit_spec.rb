require 'rails_helper'

describe 'Edit An Article' do
  before :each do
    @a1 = Article.create!(title: "Title 1", body: "Body 1")
  end

  describe 'As A Visitor' do
    it 'can edit an article via the show page' do
      visit article_path(@a1)

      expect(page).to have_content(@a1.title)
      expect(page).to have_content(@a1.body)

      expect(page).to have_link('Edit')
      click_link('Edit')

      expect(current_path).to eq(edit_article_path(@a1))

      fill_in "article[title]", with: "Wowie Wowie"
      fill_in "article[body]", with: "I LeeLuLeeeee"
      click_button 'Update Article'

      expect(@a1.title).to eq("Wowie Wowie")
      expect(@a1.body).to eq("I LeeLuLeeeee")
    end
  end
end