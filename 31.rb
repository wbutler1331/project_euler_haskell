count = 0
(0..200).each do |p1|
  accum 
  (0..100).each do |p2|
    (0..40).each do |p5|
      (0..20).each do |p10|
        (0..10).each do |p20|
          (0..4).each do |p50|
            (0..2).each do |p100|
              (0..1).each do |p200|
                if (p1*1)+(p2*2)+(p5*5)+(p10*10)+(p20*20)+(p50*50)+(p100*100)+(p200*200) == 200
                  count += 1
                  puts "Found one: #{p1},#{p2},#{p5},#{p10},#{p20},#{p50},#{p50},#{p100},#{p200}"
                end
              end
            end
          end
        end
      end
    end
  end
end

puts count
