defmodule ElixirBlink do

  def main(_args) do
    GPIO.write_mode("13")
    Enum.each 1..10, fn(_x) -> toggle() end
  end

  defp toggle() do
    GPIO.on("13")
    :timer.sleep 500
    GPIO.off("13")
    :timer.sleep 500
  end
end


