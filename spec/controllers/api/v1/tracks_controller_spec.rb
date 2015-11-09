require 'spec_helper'

describe Api::V1::TracksController do
  describe 'GET #index' do
    before :each do
      playlist = FactoryGirl.create(:playlist)
      @tracks = FactoryGirl.create_list(:track, 5, playlist_id: playlist.id)
      get :index, { playlist_id: playlist.id }, format: :json
    end

    it { should respond_with 200 }

    it 'shoud responde with 5 tracks' do
      expect(json_response[:tracks].length).to eql 5
    end
  end

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
    before :each do
      @track = FactoryGirl.create(:track)
    end

    context 'when is successfully updated' do
      before :each do
        patch :update, { id: @track.id, track: { name: 'foo' } }, format: :json
      end

      it { should respond_with 200 }

      it 'renders the json representation for the track updated' do
        expect(json_response[:track][:name]).to eql 'foo'
      end
    end

    context 'when is not updated' do
      it 'should respond with 404 if track is not found' do
        patch :update, { id: -1 }, format: :json
        expect(response.status).to eql 404
      end
    end
  end
end
