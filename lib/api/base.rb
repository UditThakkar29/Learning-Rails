class Api::Base
  attr_accessor :names
  def initialize(api,params)
    names = []
    1.upto(api.required_params_names.count) do |i|
      names << api.required_params_names[i-1]
    end
  end

  def call(api,params)
    url = api.url + params[names[0]]
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = '1bc3863abfmsh5ee9b480de718b6p173948jsn0e0030dc2c79'
    request["X-RapidAPI-Host"] = api.api_host

    @response = http.request(request)
    @response = @response.read_body
    @response = JSON.parse(@response)
    @pagy, @data = pagy(save_data(@response,api))
  end
end

