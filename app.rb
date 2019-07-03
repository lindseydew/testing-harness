require 'sinatra'
require 'json'
require 'csv'

get '/graph' do
  erb :index
end

get '/test' do
  {:top_movie => "top_movie", :rating => "rating"}.to_json
end

get '/api' do
  content_type :json
  array_size =  50000;
  x = []
  y = []
  while array_size <  10000000  do
    array_size += array_size
    array = Array.new(array_size) { rand 1000 }
    x.push(array_size)
    time_taken = last(array)
    y.push(time_taken)
    end;
  {:x => x, :y => y}.to_json
end

def pairs(arr)
  total = 0
  arr.each { |e|
    arr.each { |a|
      total += e + a
    }
  }
end

def last(arr)
  t1 = Time.now
  arr[arr.length - 1]
  t2 = Time.now
  t2 - t1
end

def sum(arr)
  total = 0
  arr.each { |e| total += e }
  return total
end

def reverse(arr)
  arr.reverse
end

def sort(arr)
  t1 = Time.now
  arr.sort
  t2 = Time.now
  t2 - t1
end
