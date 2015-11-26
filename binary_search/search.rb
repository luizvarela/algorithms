class BinarySearch

  def initialize(list)
    raise ArgumentError unless sorted? list
    @list = list
  end

  def search_for(value, list = @list, from=0, to=nil)
    to = list.length if to.nil?

    middle = (from + to) / 2

    if value < list[middle]
      search_for value, list, from, middle - 1
    elsif value > list[middle]
      search_for value, list, from + 1, to
    else
      middle
    end
  end

  private

  def sorted? list
    list.each_cons(2).all? { |a,b| (a <=> b) <= 0 }
  end
end
