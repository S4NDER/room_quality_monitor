class FakesController < ApplicationController
      def create
        @audio = Audio.new({"value"=>98})
        @temperature = Temperature.new({"value"=>17.8})
        @luminosity = Luminosity.new({"value"=>17})
        @humidity = Humidity.new({"value"=>25})
        @device = Device.new({"audio"       => @audio,
                              "temperature" => @temperature,
                              "luminosity"  => @luminosity,
                              "humidity"    => @humidity,
                              "device_name" => "simulator_100"})
    
        if @device.save
          flash[:success] = "Insert device was ok"
          redirect_to control_path
        else
          flash[:success] = "Insert device was NOK"
          redirect_to control_path
        end
      end    
    end