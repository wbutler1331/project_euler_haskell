n = 2
r = [1,1]
while true
  newterm = r[-1]+r[-2]
  r<<newterm
  n+=1
  if newterm.to_s.length == 1000
    puts n
    break
  end
end
