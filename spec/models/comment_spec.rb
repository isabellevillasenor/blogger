require 'rails_helper'

describe Comment do 

  describe "relationships" do
    it { should belong_to(:article) }
  end
  
end