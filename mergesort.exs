defmodule Mergesort do
  def merge([], y), do: y
  def merge(x, []), do: x

  def merge([x | xs], [y | ys]) do
    if x > y do
      [y | merge([x | xs], ys)]
    else
      [x | merge(xs, [y | ys])]
    end
  end

  def mergesort([]), do: []
  def mergesort([x | []]), do: [x]
  def mergesort([x, y | []]), do: if(x > y, do: [y, x], else: [x, y])

  def mergesort(l) do
    p = div(length(l), 2)
    merge(mergesort(Enum.take(l, p)), mergesort(Enum.drop(l, p)))
  end
end

IO.inspect(Mergesort.mergesort([5, 9, 1, 3, 4, 6, 6, 3, 2]))
