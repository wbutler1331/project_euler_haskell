require './core'

fibn(1,2,4000000).select(:even).inject(:+)
