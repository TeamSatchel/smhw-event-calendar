require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of :title }

  it { should delegate_method(:as_json).to(:decorate) }
end
