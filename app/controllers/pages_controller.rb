class PagesController < ApplicationController
  def home
    redirect_to transactions_path if logged_in?
  end
end
