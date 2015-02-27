require 'openssl' # mod_exp
require 'set'
require './lib/grid'
require './lib/point'

module EulerExtensions

  def pandigital?
    str = self.to_s
    str.split(//).sort.map(&:to_i) == (1..str.length).to_a
  end

  def can_be_written_as_sum_of_any? arr
    arr.each do |n|
      arr.each do |nn|
        return true if n+nn == self
      end
    end
    false
  end

  def abundant?
    self.proper_factors.inject(:+) > self
  end

  def amicable_pair
    potential_pair = self.proper_factors.inject(:+)
    return nil if potential_pair == self #cant be the same number
    if potential_pair.proper_factors.inject(:+) == self
      [self,potential_pair]
    else
      nil
    end
  end

  def proper_factors
    self.factors.inject(:+).select { |n| n != self }
  end

  def factorial
    f = 1; for i in 1..self; f*=i; end; f
  end

  def index_prime
    primes = 2
    try = 3
    while primes < self
      try += 2 #even numbers (except 2) are divisible by 2
      if try.is_prime?
        primes += 1
      end
    end
    try
  end


  #used to support a range and shorten mod blocks
  def divisible_by? o
    if o.respond_to? :all?
      o.all? { |n| self % n == 0 }
    elsif o.is_a? Fixnum
      self % o == 0
    end
  end

  def is_palindrome?
    self.to_s.reverse == self.to_s
  end

  def even?
    self % 2 == 0
  end

  def odd?
    not even?
  end

  def is_prime?
    return false if self <= 1
    return true if self == 2

    (2..(Math.sqrt(self)).ceil).each do |n|
      return false if self % n == 0
    end
    true
  end

  def prime_factors
    if self < 0
      raise Error "number must be > 0"
    end

    #edge case
    #1) a prime number only has factors 1 and self
    #2) and 1 is not prime
    return Set.new [self] if self.is_prime?

    factors = Set.new
    (2..(Math.sqrt(self)).ceil).each do |n|
      factors.add n if self % n == 0 and n.is_prime?
    end
    factors
  end

  def abundant
    proper_factors.inject(:+) > self
  end

  def proper_factors
    factors.inject(:+).select { |n| n != self }.uniq
  end

  def factors
    if self < 0
      raise Error "number must be > 0"
    end

    factors = Set.new [[1,self]]
    (2..(Math.sqrt(self)).ceil).each do |n|
      factors.add [n,self/n].sort if self % n == 0
    end
    factors
  end

  def fermat_is_prime?
    warn "Fermat's algorithm not implemented completely"
    return true if self == 2
    # pick a random number, st. 2 <= n <= self-1
    a = Random.rand(2..self-1)
    # if a ^ self mod self == a mod self then self is prime
    c1 = a.to_bn.mod_exp(self,self)
    c2 = (a % self)

    return c1 == c2

  end

  def is_triangular?
    (Math.sqrt(8*self+1)-1) % 2 == 0
  end

  def collatz
    sequence = []
    n = self
    while n != 1
      if n.even?
        n = n / 2
      else
        n = (n*3)+1
      end
      sequence << n
    end
    sequence
  end
end

class Fixnum
  include EulerExtensions
end

class Bignum
  include EulerExtensions
end

class Proc
  def self.compose(f,g)
    lambda { |*args| f[g[*args]] }
  end

  def *(g)
    Proc.compose(self,g)
  end
end

class Object
  def not_nil?
    not nil?
  end
end

def fibn(s1,s2,n)
  r = [s1,s2]
  while true
    newterm = r[-1]+r[-2]
    r<<newterm
    if newterm >= n
      return r
    end
  end
end

def is_pyth_triplet?(a,b,c)
  (a**2)+(b**2)==(c**2)
end
