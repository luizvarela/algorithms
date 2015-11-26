require 'minitest/autorun'
require './search'

class SearchTest < Minitest::Test
  def setup
    @search = BinarySearch.new([5, 6, 12, 45, 50, 65, 100])
  end

  def test_index_to_list_value
    assert_equal 3, @search.search_for(45)
  end
end
