require 'rails_helper'

describe 'Tags Index' do
  describe 'As A Visitor' do
    it 'displays all tags as links' do
      @t1 = Tag.create!(name: "greetings")
      @t2 = Tag.create!(name: "friendship")
     
      visit tags_path
      
      expect(page).to have_link(@t1.name)
      expect(page).to have_link(@t2.name)
    end
  end
end