require "spec_helper"

describe ClientsController do
  describe "GET new" do
    it "sets @client" do
      get :new
      expect(assigns(:client)).to be_instance_of(Client)
    end
  end

  describe "POST create" do
    context "with valid input" do
      it "creates the client record" do
        client1 = Fabricate.attributes_for(:client)
        post :create, client: client1
        expect(Client.first.first_name).to eq(client1[:first_name])
      end

      it "sets the success message"

      it "redirects to the client page" do
        post :create, client: {first_name: "Andy", last_name: "Anderson"}
        expect(response).to redirect_to(client_path(Client.first.id))
      end
    end

    context "with invalid input" do
      it "does not create the record"
      it "sets @client"
      it "sets the error message"
      it "renders the :create template"
    end


  end
end
