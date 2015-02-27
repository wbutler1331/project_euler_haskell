require './core'

def t msg
  # puts msg
  # gets
end

max = [0,0]
len = 0

(-1_000..1_000).each do |a|
  (-1_000..1_000).each do |b|
    t "trying #{a},#{b}"
    temp_len = 0
    n = 0
    while true
      t "trying with #{n}"
      res = ((n**2)+(a*n)+(b))
      if res.is_prime?

        t "#{res} is prime"
        temp_len += 1
        t "len is #{temp_len}"
        n+=1
      else
        t "#{res} NOT prime"
        t "len is #{temp_len}"
        break
      end
    end
    if temp_len > len
      max = [a,b]
      len = temp_len
    end
  end
end
puts len
puts max[0]*max[1]
puts max[0]
puts max[1]
