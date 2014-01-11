class UsersController < ApplicationController
  require 'json'
  require 'rest-client'
  skip_before_filter :verify_authenticity_token, :only => [:change_to_login,:change_to_root_page]

  def two_dimensional_code
    code = rand(10)+rand(100)+rand(1000)
    @code = code.to_s
    @url = 'http://192.168.1.6:3001/sessions/login/'+@code
  end

  def show
    if params[:page]=='1' ||params[:page]==nil
      counter = 1
    else
      counter =  (params[:page].to_i-1)*10+1
    end
    @counter = counter
    data = JSON.parse RestClient.get('http://192.168.1.6:3001/request/data/'+params[:user_name])
    @name = data["user"]
    @activities = data['activities'].sort_by {|activity| activity['activity_id'].to_i}
    @bid_lists=data['bid_lists'].groop_by {|bid_list| bid_list['activity_id']}
    @sign_ups = data['sign_ups'].group_by{|sign_up| sign_up['activity_id']}
    puts '--------------------------------'
    puts @activities
    puts '----------------------------------'
    puts @sign_ups['2'].length
  end

  def logout
  end

  def is_used
    render :text =>  RestClient.get('http://192.168.1.6:3001/code/used/'+params[:code])
  end

end
