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

      it "sets the success message" do
        client1 = Fabricate.attributes_for(:client)
        post :create, client: client1
        expect(flash[:success]).to be_present
      end

      it "redirects to the client page" do
        post :create, client: {first_name: "Andy", last_name: "Anderson"}
        expect(response).to redirect_to(client_path(Client.first.id))
      end
    end

    context "with invalid input" do
      it "does not create the record" do
        post :create, client: { first_name: "Bob" }
        expect(Client.count).to eq(0)
      end

      it "sets @client" do
        post :create, client: { first_name: "Bob" }
        expect(assigns(:client)).to be_instance_of(Client)
      end

      it "sets the error message" do
        post :create, client: { first_name: "Bob" }
        expect(flash[:danger]).to be_present
      end
      
      it "renders the :create template" do
        post :create, client: { first_name: "Bob" }
        expect(response).to render_template :new
      end
    end


  end
end
