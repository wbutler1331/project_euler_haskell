nums = [1,2,5,10,20,50,100,200]
ways = 0
(0..200).each do |one|
  (0..100).each do |two|
    (0..40).each do |five|
      (0..20).each do |ten|
        (0..10).each do |twenty|
          (0..4).each do |fifty|
            (0..2).each do |hund|
              if (one)+(two*2)+(five*5)+(ten*10)+(twenty*20)+(fifty*50)+(hund*100) == 200
                ways += 1
                puts ways
                puts "#{one},#{two},#{five},#{ten},#{twenty},#{fifty},#{hund}"
              end
            end
          end
        end
      end
    end
  end
end

puts ways+1
