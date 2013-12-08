defmodule ElixirBlink do

  def main(args) do 
    GPIO.write_mode("13")
    GPIO.on("13")
    :timer.sleep(1000)
    GPIO.off("13")
  end

end


