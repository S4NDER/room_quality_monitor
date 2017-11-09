class FakesController < ApplicationController
      def create
        @audio = Audio.new({"value"=>9})
        @temperature = Temperature.new({"value"=>22})
        @luminosity = Luminosity.new({"value"=>17})
        @humidity = Humidity.new({"value"=>25})
        @device = Device.new({"audio"       => @audio,
                              "temperature" => @temperature,
                              "luminosity"  => @luminosity,
                              "humidity"    => @humidity})
    
    
        if @device.save
          flash[:success] = "Insert device was ok"
          redirect_to profile_path
        else
          flash[:success] = "Insert device was NOK"
          redirect_to profile_path
        end
      end    
    end