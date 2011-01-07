require 'benchmark'

module Benchmark
  # Iterate over the passed in collection, outputing benchmark info at each step
  #
  # @param [Enumerable] collection the collection to iterate over
  # @param [Hash] options the collection to iterate over
  # @option options [String] :start_caption ("Started processing collection\n") Output before starting
  # @option options [String] :finish_caption ("Finished processing collection") Output when finished, on same line as total time
  # @option options [String] :format ("- %r\n") Format String for benchmark (fmtstr)
  # @option options [Symbol, String] :item_to_s (:to_s) Output before starting

  def self.timed_each(collection, options={}, &block)
    caption = options[:start_caption] || "Started processing collection\n"
    finish_caption = options[:finish_caption] || "Finished processing collection"
    label_width = nil
    fmtstr = options[:format] || "- %r\n"
    item_to_s = options[:item_to_s] || :to_s
    
    benchmark(caption, label_width, fmtstr, finish_caption) do |x|
      [collection.map do |item|
        x.report("  processing #{item.send(item_to_s)} -") do
          block.call(*item)
        end
      end.inject(&:+)]
    end
  end
end

