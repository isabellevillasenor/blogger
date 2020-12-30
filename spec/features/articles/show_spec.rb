require 'rails_helper'

describe 'Article Show Page' do
  before :each do
    @a1 = Article.create!(title: "Title 1", body: "Body 1")
    @a2 = Article.create!(title: "Title 2", body: "Body 2")
    @c1 = @a1.comments.create(author_name: "it me", body: "interesting")
    @c2 = @a1.comments.create(author_name: "it also me", body: "sugoi")
  end
  describe 'As A Visitor' do
    it 'should show the articles title body and comments' do
      visit "/articles/#{@a1.id}"

      expect(page).to have_content(@a1.title)
      expect(page).to have_content(@a1.body)
      expect(page).to have_content(@c1.author_name)
      expect(page).to have_content(@c1.body)
      expect(page).to have_content(@c2.author_name)
      expect(page).to have_content(@c2.body)

      expect(page).to_not have_content(@a2.title)
    end

    it 'should have link to go back to articles index' do
      visit "/articles/#{@a1.id}"

      expect(page).to have_link("<< Back to Articles List")
      click_link

      expect(current_path).to eq(articles_path)
    end

    it 'should have a link to delete article and reroute to index' do
      visit "/articles/#{@a1.id}"

      expect(page).to have_link('Delete')
      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(@a2.title)
      expect(page).to_not have_content(@a1.title)
    end

    it 'should have a link to edit article and reroute to edit page' do
      visit "/articles/#{@a1.id}"

      expect(page).to have_link('Edit')
      click_link 'Edit'

      expect(current_path).to eq(edit_article_path(@a1))
    end


  end
end