defmodule ElixirBlinkTest do
  use ExUnit.Case
  import Mock

  test "the truth" do
    assert(true)
  end

  test_with_mock "GPIO.write_mode writes 1 to appropriate file", File, 
  [write: fn(_file,_contents) -> () end] do 
    GPIO.write_mode("13")
    assert called File.write("/sys/devices/virtual/misc/gpio/mode/gpio13", "1")
  end

end
