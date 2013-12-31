defmodule GPIO do
  @base_path "/sys/devices/virtual/misc/gpio/"
  @mode_path "#{@base_path}mode/gpio"
  @pin_path  "#{@base_path}pin/gpio"
  
  def write_mode(pin) do
    File.write("#{@mode_path}#{pin}", "1")
  end

  def read_mode(pin) do
    File.write("#{@mode_path}#{pin}", "0")
  end

  def on(pin) do
    File.write("#{@pin_path}#{pin}", "1") 
  end

  def off(pin) do
    File.write("#{@pin_path}#{pin}", "0")
  end
end
