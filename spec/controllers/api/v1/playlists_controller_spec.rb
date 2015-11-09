require 'spec_helper'

describe Api::V1::PlaylistsController do
  describe 'GET #show' do
    context 'when is successfully found' do
      before :each do
        @playlist = FactoryGirl.create(:playlist)
        get :show, { id: @playlist.id }, format: :json
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
        @playlist_attrs = FactoryGirl.attributes_for(:playlist)
        post :create, { playlist: @playlist_attrs }, format: :json
      end

      it { should respond_with 200 }

      it 'renders the json representation for the playlist record created' do
        name = json_response[:playlist][:name]
        expect(json_response).to have_key(:playlist)
        expect(name).to eql @playlist_attrs[:name]
      end
    end

    context 'when is not created' do
      before :each do
        @invalid_playlist_attrs = { name: 'foo' }
        post :create, { playlist: @invalid_playlist_attrs }, format: :json
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
