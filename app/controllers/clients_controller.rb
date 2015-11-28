class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:success] = "#{@client.first_name} #{@client.last_name} has been created successfully."
      redirect_to client_path(@client)
    else
      flash.now[:danger] = "Please fix the following errors."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:success] = "#{@client.first_name} #{@client.last_name} has been updated successfully."
      redirect_to client_path(@client)
    else
      flash.now[:danger] = "Please correct the following errors."
      render :edit
    end
  end

  def destroy
    if @client.delete
      flash[:success] = "Client has been deleted successfully."
      redirect_to root_path
    end
  end

  private
  def client_params
    params.require(:client).permit(
      :first_name,
      :last_name,
      :title,
      :company,
      :address,
      :city,
      :state,
      :zip,
      :phone_office,
      :phone_mobile,
      :email
    )
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
