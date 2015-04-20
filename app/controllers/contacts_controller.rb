class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html {redirect_to root_path, notice: "Thank you for you contacting us"}
        format.js { render :create_success }
      else
        format.html {redirect_to root_path, alert: "Didn't go through...please make sure to fill out all fields"}
        format.js { render :create_failure }
      end
    end
  end

  private 

  def contact_params
    params.require(:contact).permit(:name, :subject, :email, :message)
  end

end
