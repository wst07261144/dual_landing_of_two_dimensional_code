class UsersController < ApplicationController
  require 'json'
  require 'rest-client'
  require 'will_paginate/array'
  skip_before_filter :verify_authenticity_token, :only => [:change_to_login,:change_to_root_page]

  def two_dimensional_code
    code = rand(10)+rand(100)+rand(1000)+rand(10000)
    @code = code.to_s
    @url = 'http://192.168.1.132:3001/sessions/login/'+@code
  end

  def show

    a=[],sign_ups=[],bid_lists=[]
    data = JSON.parse RestClient.get('http://192.168.1.132:3001/request/data/'+params[:user_name])
    @code = data["code"]
    @name = data["user"]
    activities = data['activities'].sort_by {|activity| activity['activity_id'].to_i}
    data['sign_ups'].group_by{|sign_up| sign_up['activity_id']}.each do |key,value|
      sign_ups.push({:activity_id=>key,:num=>value.length})
    end
    data['bid_lists'].group_by {|bid_list| bid_list['activity_id']}.each do |key,value|
      bid_lists.push({:activity_id=>key,:num=>value.length})
    end
    activities.each do |t|
      t['bid_num'] = get_num bid_lists,t['activity_id']
      t['sign_up_num'] = get_num sign_ups,t['activity_id']
    end
    session[:activities] = activities
    @activities = session[:activities].paginate(page: params[:page], per_page: 10)
    session[:activities] = nil
  end

  def get_num (array, id)
    array.each do |t|
      if t[:activity_id].to_i == id.to_i
        return t[:num]
      end
    end
    return 0
  end

  def logout
    redirect_to root_path
  end

  def is_used
    render :text =>  RestClient.get('http://192.168.1.132:3001/code/used/'+params[:code])
  end

  def is_logout
    render :text=> RestClient.get('http://192.168.1.132:3001/code/logout/'+params[:code])
  end

end
