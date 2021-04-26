require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Belongs' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
