class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:success] = "#{@client.first_name} #{@client.last_name} has been create successfully."
      redirect_to client_path(@client)
    else

    end

  end

  private
  def client_params
    params.require(:client).permit(
      :first_name, :last_name, :title, :company,
      :address, :city, :state, :zip,
      :phone_office, :phone_mobile, :email
    )
  end
end
