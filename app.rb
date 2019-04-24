require 'sinatra'
require 'json'
require 'csv'

get '/graph' do
  erb :index
end

get '/test' do
  csv = CSV.read("resources/ratings.csv", headers: true)
  hash = {}
  csv.each do |row|
    movie_id = row[1]
    rating = row[2]
    ratings = hash[movie_id] || []
    hash[movie_id] = ratings.push(rating)
  end
  hash1 = {}
  hash.each do |k,v|
    average_rating = v.map(&:to_i).reduce(0, :+)/(v.length*1.0)
    hash1[k] = average_rating
  end
  hash2 = hash1.sort_by { |k,v| -v }
  top_movie = hash2[0][0]
  rating = hash2[0][1]
  {:top_movie => top_movie, :rating => rating}.to_json
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
    time_taken = sort(array)
    y.push(time_taken)
    end;
  {:x => x, :y => y}.to_json
end

def last(arr)
  t1 = Time.now
  arr[arr.length - 1]
  t2 = Time.now
  t2 - t1
end

def sort(arr)
  t1 = Time.now
  arr.sort
  t2 = Time.now
  t2 - t1
end
