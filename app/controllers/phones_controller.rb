class PhonesController < ApplicationController
  before_action :set_phone

  def show
    render json: @phones
  end

  private
  def set_phone
    @phones = Contact.find(params[:contact_id]).phones
  end
end
