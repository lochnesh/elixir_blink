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

  test_with_mock "GPIO.read returns :off when 0 is read", File, 
  [read: fn(_file) -> ({:ok, "0\n"}) end] do 
    assert :off === GPIO.read("13") 
  end

  test_with_mock "GPIO.read returns :on when 1 is read", File, 
  [read: fn(_file) -> ({:ok, "1\n"}) end] do 
    assert :on === GPIO.read("13") 
  end

  test_with_mock "GPIO.read returns :error when error occurs", File, 
  [read: fn(_file) -> ({:error, "1\n"}) end] do 
    assert :error === GPIO.read("13") 
  end


end
