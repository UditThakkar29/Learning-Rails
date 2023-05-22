class HomeController < ApplicationController
  def index
    @apis = Api.all
  end
end
