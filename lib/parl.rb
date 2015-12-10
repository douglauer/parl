require 'thread'

module Enumerable
  def parl (n)
    todo = Queue.new
    ts = (1..n).map {
      Thread.new {
        while x = todo.deq
          yield x[0]
        end
      }
    }
    each{|x| todo << [x]}
    n.times{ todo << nil }
    ts.each{|t| t.join}
  end
end

