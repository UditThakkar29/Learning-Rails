require 'uri'
require 'net/http'
require 'json'
include Pagy::Backend
# require_relative '/lib/api/base'

class ApisController < ApplicationController
  before_action :set_api, only: %i[ show edit update destroy ]

  # GET /apis or /apis.json
  def index
    @apis = Api.all
  end

  # GET /apis/1 or /apis/1.json
  def show
  end

  # GET /apis/new
  def new
    @api = Api.new
  end

  # GET /apis/1/edit
  def edit
  end

  # POST /apis or /apis.json
  def create
    @api = Api.new(api_params)

    respond_to do |format|
      if @api.save
        format.html { redirect_to api_url(@api), notice: "Api was successfully created." }
        format.json { render :show, status: :created, location: @api }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1 or /apis/1.json
  def update
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to api_url(@api), notice: "Api was successfully updated." }
        format.json { render :show, status: :ok, location: @api }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1 or /apis/1.json
  def destroy
    @api.destroy

    respond_to do |format|
      format.html { redirect_to apis_url, notice: "Api was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def call_api
    api = Api.find(params[:id])
    if api.stored_locally == nil
      api_call = Api::Base.new(api,params)
      api_call.call(api,params)
      # names = []
      # 1.upto(api.required_params_names.count) do |i|
      #   names << api.required_params_names[i-1]
      # end
      # Api::Base.new(api)

      # url = URI("https://pokedex2.p.rapidapi.com/pokedex/#{params[names[0]]}")

      # http = Net::HTTP.new(url.host, url.port)
      # http.use_ssl = true

      # request = Net::HTTP::Get.new(url)
      # request["X-RapidAPI-Key"] = '8cfd27eec2msh2ccaebe4015a426p120df5jsnb53200975824'
      # request["X-RapidAPI-Host"] = 'pokedex2.p.rapidapi.com'

      # @response = http.request(request)
      # @response = @response.read_body
      # @response = JSON.parse(@response)
      # @pagy, @data = pagy(save_data(@response,api))

    else
      @pagy, @data = pagy(Pokemon.all)
    end
  end

  def save_data(response,api)
    1.upto(response.count) do |i|
      img_url = response[i-1]['ThumbnailImage']
      name = response[i-1]['name']
      abilities = []
      weakness = []
      response[i-1]["abilities"].each do |ability|
        abilities << ability
      end
      response[i-1]["weakness"].each do |weak|
        weakness << weak
      end
      Pokemon.create(image_url: img_url,name: name, abilities: abilities, weakness: weakness)
    end
    @pokemons = Pokemon.all
    api.stored_locally = true
    debugger
    return @pokemons
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
      @api = Api.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_params
      params.require(:api).permit(:name, :description, :url)
    end
end
