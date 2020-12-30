require 'rails_helper'

describe 'As A Visitor' do
  before :each do
    @a1 = Article.create!(title: "Oh Hello", body: "How're you doing today, dear reader?")
    @t1 = @a1.tags.create!(name: "greetings")
  end

  describe 'they are linked from the show page' do
    it 'should have the tags information' do
      visit article_path(@a1)
      click_link 'greetings'

      expect(current_path).to eq(tag_path(@t1))
      expect(page).to have_link('Oh Hello')
    end
  end
end