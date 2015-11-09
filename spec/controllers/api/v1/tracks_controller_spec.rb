require 'spec_helper'

describe Api::V1::TracksController do
  describe 'GET #show' do
    context 'when is successfully found' do
      before :each do
        @track = FactoryGirl.create(:track)
        get :show, { id: @track.id }, format: :json
      end

      it { should respond_with 200 }
    end

    context 'when is not found' do
      before :each do
        get :show, { id: -1 }, format: :json
      end

      it { should respond_with 404 }
    end
  end

  describe 'POST #create' do
    context 'when is successfully created' do
      before :each do
        @track_attrs = FactoryGirl.attributes_for(:track)
        post :create, { track: @track_attrs }, format: :json
      end

      it { should respond_with 200 }

      it 'renders the json representation for the track record created' do
        name = json_response[:track][:name]
        expect(json_response).to have_key(:track)
        expect(name).to eql @track_attrs[:name]
      end
    end

    context 'when is not created' do
      before :each do
        @invalid_track_attrs = { name: 'foo' }
        post :create, { track: @invalid_track_attrs }, format: :json
      end

      it { should respond_with 422 }

      it 'renders the json representation of validation errors' do
        expect(json_response).to have_key(:errors)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'when is successfully updated' do

    end

    context 'when is not updated' do

    end
  end
end
