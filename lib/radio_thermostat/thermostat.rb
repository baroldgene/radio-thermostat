require 'HTTParty'

module RadioThermostat
  class Thermostat
    HEAT_MODE = 1
    COOL_MODE = 2
    OFF_MODE  = 0


    def initialize(ip)
      @ip = ip
      @url = 'http://192.168.1.7/tstat'
    end

    def current_temp?
      data = get()
      return data['temp']
    end

    def mode?
      data = get()
      mode = data['tmode']
      if mode == HEAT_MODE
        'heat'
      elsif mode == COOL_MODE
        'cool'
      elsif mode == OFF_MODE
        'off'
      else
        'dafuq?'
      end
    end

    def target_temp?
      data = get()
      key = data.keys.select{|i| i =~ /t_(heat|cool)/}.first
      return data[key]
    end

    def set_target(temp)
      post t_heat: temp.to_i
    end

    def set_mode(mode)
      return false unless [HEAT_MODE, OFF_MODE, COOL_MODE].include? mode
      post tmode: mode
    end

    def data
      get
    end


   private
    def post(params, route = '/')
      body = params.to_json
      response = HTTParty.post(@url + route.to_s, body: body, headers: { 'Content-Type' => 'application/json' } )
      return response.success?
    end

    def get(route = '/')
      response = HTTParty.get(@url+route.to_s)
      begin
        data = JSON.parse(response.body)
      rescue JSON::ParserError
        data = nil
      end
      return data
    end
  end
end
