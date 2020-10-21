# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  #validates :user_id, presence: true // - means that  you cant post without being logged in!
  it { is_expected.to be }
end
