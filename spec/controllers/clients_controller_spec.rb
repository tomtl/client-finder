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
      let(:client1) { Fabricate.attributes_for(:client) }
      before { post :create, client: client1 }

      it "creates the client record" do
        expect(Client.first.first_name).to eq(client1[:first_name])
      end

      it "sets the success message" do
        expect(flash[:success]).to be_present
      end

      it "redirects to the client page" do
        expect(response).to redirect_to(client_path(Client.first.id))
      end
    end

    context "with invalid input" do
      before { post :create, client: { first_name: "Bob" } }

      it "does not create the record" do
        expect(Client.count).to eq(0)
      end

      it "sets @client" do
        expect(assigns(:client)).to be_instance_of(Client)
      end

      it "sets the error message" do
        expect(flash[:danger]).to be_present
      end

      it "renders the :create template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET show" do
    it "sets @client" do
      client1 = Fabricate(:client)
      get :show, id: client1.id
      expect(assigns(:client)).to eq(client1)
    end
  end

  describe "GET edit" do
    it "sets @client" do
      client1 = Fabricate(:client)
      get :edit, id: client1.id
      expect(assigns(:client)).to eq(client1)
    end
  end
end
