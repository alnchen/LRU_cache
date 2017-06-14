require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    resize! if @count == num_buckets

    if include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else
      @store[key.hash % num_buckets].append(key, val)
      @count += 1
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    @store[key.hash % num_buckets].remove(key)
    @count -=1
  end

  def each
    # @store.each do |bucket|
    #   bucket.each do |link|
    #     yield link
    #   end
    # end
    @store.each do |bucket|
      bucket.each do |link|
        yield [link.key, link.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    cur_store = @store
    new_store = Array.new(num_buckets * 2) { LinkedList.new }
    @store = new_store
    @count = 0
    cur_store.each do |bucket|
      bucket.each { |link| set(link.key, link.val)}
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
