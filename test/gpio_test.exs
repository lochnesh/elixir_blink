defmodule ElixirBlinkTest do
  use ExUnit.Case
  import Mock

  test_with_mock "GPIO.write_mode writes 1 to appropriate file", File, 
  [write: fn(_file,_contents) -> () end] do 
    GPIO.write_mode("13")
    assert called File.write("/sys/devices/virtual/misc/gpio/mode/gpio13", "1")
  end

  test_with_mock "GPIO.read_mode writes 0 to appropriate file", File, 
  [write: fn(_file,_contents) -> () end] do 
    GPIO.read_mode("13")
    assert called File.write("/sys/devices/virtual/misc/gpio/mode/gpio13", "0")
  end

  test_with_mock "GPIO.pull_up_mode writes 8 to appropriate file", File, 
  [write: fn(_file,_contents) -> () end] do 
    GPIO.pull_up_mode("13")
    assert called File.write("/sys/devices/virtual/misc/gpio/mode/gpio13", "8")
  end

  test_with_mock "GPIO.on writes 1 to appropriate file", File, 
  [write: fn(_file,_contents) -> () end] do 
    GPIO.on("13")
    assert called File.write("/sys/devices/virtual/misc/gpio/pin/gpio13", "1")
  end

  test_with_mock "GPIO.off writes 0 to appropriate file", File, 
  [write: fn(_file,_contents) -> () end] do 
    GPIO.off("13")
    assert called File.write("/sys/devices/virtual/misc/gpio/pin/gpio13", "0")
  end

  test_with_mock "GPIO.read reads from correct file", File, 
  [read: fn(_file) -> ("0\n") end] do 
    assert GPIO.read("13") === "0\n"
  end


end
