require 'rails_helper'

RSpec.describe List, type: :model do
  it { should validate_presence_of :title_list }
  it { should have_many(:tasks) }
  it { should belong_to(:user) }
end
