# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

u1 = User.create name: 'l33tcod3r', email: 'leetcoder@gmail.com', password: 'chicken'
u2 = User.create name: 'haxor', email: 'haxor@gmail.com', password: 'chicken'
u3 = User.create name: 'noobcoder', email: 'noobcoder@gmail.com', password: 'chicken'

puts "Created #{User.all.length} users."


Challenge.destroy_all

c1 = Challenge.create name: 'Square number', description: "Return the square of the given inputs", user_id: u1.id
c2 = Challenge.create name: 'Longest number', description: "Have the function LongestWord(sen) take the sen parameter being passed and return the largest word in the string. If there are two or more words that are the same length, return the first word from the string with that length. Ignore punctuation and assume sen will not be empty. ", user_id: u1.id

puts "Created #{Challenge.all.length} Challenges."

TestPair.destroy_all

tp1 = TestPair.create input: 1, output: 1, input_type: 0, output_type: 0, challenge_id: c1.id
tp2 = TestPair.create input: 2, output: 4, input_type: 0, output_type: 0, challenge_id: c1.id
tp3 = TestPair.create input: 3, output: 9, input_type: 0, output_type: 0, challenge_id: c1.id
tp4 = TestPair.create input: 4, output: 16, input_type: 0, output_type: 0, challenge_id: c1.id
tp5 = TestPair.create input: 5, output: 25, input_type: 0, output_type: 0, challenge_id: c1.id
tp6 = TestPair.create input: 6, output: 36, input_type: 0, output_type: 0, challenge_id: c1.id
tp7 = TestPair.create input: "fun&!! time", output: "time", input_type: 1, output_type: 1, challenge_id: c2.id
tp8 = TestPair.create input: "I love dogs", output: "love", input_type: 1, output_type: 1, challenge_id: c2.id

puts "Created #{TestPair.all.length} TestPairs."

Solution.destroy_all

s1 = Solution.create code: "return (x * x);", challenge_id: c1.id, user_id: u1.id

puts "Created #{Solution.all.length} Solutions."
