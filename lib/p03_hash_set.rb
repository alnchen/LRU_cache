require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key.hash] << key
    @count += 1
    resize! if count > num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key)
  end

  private

  def [](num)
    @store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    cur_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2){[]}
    cur_store.each do |bucket|
      bucket.each do |num|
        insert(num)
      end
    end
  end
end
