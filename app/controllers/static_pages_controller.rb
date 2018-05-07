class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @credit_client_generals = Credit::Client::General.all.limit(5)
      @business_internationals = Business::International.all.limit(5)
      @business_nationals = Business::National.all.limit(5)
      @business_sites = Business::Site.all.limit(5)
    else
      redirect_to new_user_session_path
    end
    #render :layout => 'application-fluid'

  end

  def about

  end
end
