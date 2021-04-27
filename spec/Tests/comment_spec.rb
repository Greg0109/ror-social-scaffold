require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Belongs' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end
end
