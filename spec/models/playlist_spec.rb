require 'spec_helper'

describe Playlist do

  before { @playlist = FactoryGirl.create(:playlist) }

  subject { @playlist }

  it { should respond_to(:name) }
  it { should respond_to(:fb_event_id) }
  it { should be_valid }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:fb_event_id) }
  it { should have_many(:tracks) }
end
