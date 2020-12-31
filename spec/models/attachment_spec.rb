require 'rails_helper'

describe Attachment do
  describe 'relationships' do
    it { should belong_to(:article) }
  end
end