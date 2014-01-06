defmodule ButtonBlink do

  def main(_args) do 
    GPIO.write_mode("13")
    GPIO.read_mode("2")
    iterator = Stream.repeatedly(fn() -> GPIO.read("2") end) 
    Enum.each(iterator, fn(value) -> process(value) end)
  end

  def process({:ok, "0\n"}), do: GPIO.off("13")
  def process({:ok, "1\n"}), do: GPIO.on("13")
  def process({:ok, value}), do: IO.puts "Something unexpected #{value}" 
  def process(_), do: IO.puts "Something went wrong"

end
