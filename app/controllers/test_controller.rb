class TestController < ApplicationController
  caches_action :json1, :json2#, :head_ok
  #caches_page :index

  def uncached_json1
    render json: 1
  end

  def json1
    render json: 1#, content_type: 'application/json'
  end

  def json2
    render json: 2
  end

  #def head_ok
    #head :ok
  #end

  def expire_json1
    expire_action :json1 #action: :index, format: :json
    head :ok
  end

  def expire_json2
    expire_action action: :json2, format: :json
    head :ok
  end
end
