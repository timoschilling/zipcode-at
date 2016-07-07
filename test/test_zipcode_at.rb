require 'minitest/autorun'
require 'zipcode-at'
require 'set'

class TestZipCodeAT < MiniTest::Test
  class << self
    def setup
      @loaded ||= ZipCode::DB.for(:at).load
    end
  end

  def setup
    self.class.setup
  end

  def test_search_by_word_prefix
    results = ZipCode::DB.for(:at).search(:name, 'OBER')
    assert_equal(43, results.count)
  end

  def test_search_by_first_word_prefix
    results = ZipCode::DB.for(:at).search(:name, 'SPITTAL')
    assert_equal(3, results.count)
    assert_equal(Set.new(%w(9800 9802 9803)),
                 Set.new(results.map { |e| e[:zip] }))
  end

  def test_search_by_last_word_prefix
    results = ZipCode::DB.for(:at).search(:name, 'SEMMER')
    assert_equal(3, results.count)
    assert_equal('2680', results.first[:zip])
  end

  def test_search_by_full_name
    results = ZipCode::DB.for(:at).search(:name, 'WIEN')
    assert_equal(186, results.count)
    assert_equal('1000', results.first[:zip])
  end

  def test_search_by_full_name_with_space
    results = ZipCode::DB.for(:at).search(:name, 'FAAK AM SEE')
    assert_equal(1, results.count)
    assert_equal('9583', results.first[:zip])
  end
end
