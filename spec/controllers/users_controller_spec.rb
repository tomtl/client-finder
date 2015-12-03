require "rails_helper"

describe UsersController do
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "for valid input" do
      let(:user1) { Fabricate.attributes_for(:user) }
      before { post :create, user: user1 }

      it "creates the user" do
        expect(User.count).to eq(1)
      end

      it "sets the flash success message" do
        expect(flash[:success]).to be_present
      end

      it "redirects to the home page" do
        expect(response).to redirect_to root_path
      end
    end

    context "for invalid input" do
      before { post :create, user: {email: "bob@example.com"} }

      it "sets @user" do
        expect(User.count).to eq(0)
      end

      it "sets flash error message" do
        expect(flash[:danger]).to be_present
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end
    end
  end
end