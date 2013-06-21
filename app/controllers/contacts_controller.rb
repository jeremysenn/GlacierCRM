class ContactsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
#    @contacts = Contact.order(:last_name).page(params[:page]).per(50)
#    @contacts = current_user.company.contacts.order(:last_name)
    @clients = current_user.company.contacts.order(:last_name).tagged_with("Client")
    @companies = current_user.company.contacts.order(:company).tagged_with("Company")
    @personal_contacts = current_user.company.contacts.order(:last_name).tagged_with("Personal")
    respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv }
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to @contact, :notice => "Successfully created contact."
    else
      render :action => 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to @contact, :notice  => "Successfully updated contact."
    else
      render :action => 'edit'
    end
  end

  def import
    Contact.import(params[:file])
    redirect_to contacts_url, notice: "Contacts imported."
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url, :notice => "Successfully destroyed contact."
  end
end
