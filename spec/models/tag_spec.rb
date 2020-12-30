require 'rails_helper'

describe Tag do
  describe 'relationships' do
    it { should have_many(:taggings) }
    it { should have_many(:articles).through(:taggings) }
  end
end