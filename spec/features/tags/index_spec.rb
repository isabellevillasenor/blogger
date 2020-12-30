require 'rails_helper'

describe 'Tags Index' do
  before :each do 
    @t1 = Tag.create!(name: "greetings")
    @t2 = Tag.create!(name: "friendship")
    visit tags_path
  end

  describe 'As A Visitor' do
    it 'displays all tags as links' do
      expect(page).to have_link(@t1.name)
      expect(page).to have_link(@t2.name)

      click_link "#{@t1.name}"

      expect(current_path).to eq(tag_path(@t1))
    end
  end
end