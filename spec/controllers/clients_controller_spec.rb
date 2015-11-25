require "spec_helper"

describe ClientsController do
  describe "GET new" do
    it "sets @client" do
      get :new
      expect(assigns(:client)).to be_instance_of(Client)
    end
  end
end