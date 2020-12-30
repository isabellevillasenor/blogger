require 'rails_helper'

describe 'New Article' do
  describe 'As A Visitor' do
    it 'should create a new article via form from index' do
      visit articles_path

      expect(page).to have_link('Create New Article')
      click_link 'Create New Article'

      expect(current_path).to eq(new_article_path)

      fill_in :title, with: 'Wowie Wowie'
      fill_in :body, with: 'I LeeLuLeeeee'
      fill_in 'article[tag_list]', with: 'amazed, fun'
      click_button 'Create Article'

      expect(page).to have_content('Wowie Wowie')
      expect(page).to have_content('I LeeLuLeeeee')
    end
  end
end