defmodule ButtonBlink do

  def main(_args) do
    GPIO.write_mode("13")
    GPIO.read_mode("2")
    iterator = Stream.repeatedly(fn() -> GPIO.read("2") end)
    Enum.each(iterator, fn(value) -> process(value) end)
  end

  def process(:off), do: GPIO.off("13")
  def process(:on), do: GPIO.on("13")
  def process(:error), do: IO.puts "Something went wrong"

end
