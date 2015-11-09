require 'spec_helper'

describe Track do

  before { @track = FactoryGirl.create(:track) }

  subject { @track }

  it { should respond_to(:playlist) }
  it { should respond_to(:caption) }
  it { should respond_to(:link) }
  it { should respond_to(:source) }
  it { should respond_to(:name) }
  it { should respond_to(:fb_message) }
  it { should respond_to(:fb_user_id) }
  it { should respond_to(:fb_user_name) }
  it { should be_valid }
  it { should validate_presence_of(:caption) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:source) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:playlist) }
end
