#! elixir
dir = Path.dirname(__ENV__.file)
IO.puts("Creating new day in #{dir}")

last_dir =
  dir
  |> File.ls!()
  |> Enum.filter(&File.dir?/1)
  |> Enum.map(&Integer.parse/1)
  |> Enum.filter(&match?({_, ""}, &1))
  |> Enum.map(&elem(&1, 0))
  |> Enum.max()

next_dir = last_dir + 1

next_dir =
  :io_lib.format("~2..0B", [next_dir])
  |> to_string()

new_path = Path.join(dir, next_dir)
File.mkdir!(new_path)
File.touch!(Path.join(new_path, "example.txt"))
File.touch!(Path.join(new_path, "input.txt"))

File.write!(Path.join(new_path, "day#{next_dir}.livemd"), """
# Day #{next_dir}

## Part 1

## Part 2
""")
