require 'benchmark'

module Benchmark
  def self.collection_timer(collection, options={}, &block)
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

