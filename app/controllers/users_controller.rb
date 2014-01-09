class UsersController < ApplicationController

  require 'rest-client'
  skip_before_filter :verify_authenticity_token, :only => [:change_to_login,:change_to_root_page]

  def two_dimensional_code
    @code = rand(10).to_s
    @url = 'http://192.168.1.132:3001/sessions/login/'+@code
  end

  def is_used
    render RestClient.get 'localhost:3001/code/used'+params[:code]
  end

end
