defmodule ButtonBlink do

  def main(_args) do 
    GPIO.write_mode("13")
    GPIO.read_mode("3")
    iterator = Stream.repeatedly(fn() -> GPIO.read("3") end) 
    Enum.each(iterator, fn(value) -> process(value) end)
  end

  def process({:ok, "0\n"}), do: IO.puts("off")
  def process({:ok, "1\n"}), do: IO.puts("on")
  def process({:ok, value}), do: IO.puts "Something unexpected #{value}" 
  def process(_), do: IO.puts "Something went wrong"

end
