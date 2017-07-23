require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET #root" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads the index view template" do
      get :index
      expect(response).to render_template(:index)
    end

  end
end
