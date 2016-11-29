students = [
{
	"id" => 1,
	"department" => "a1",
	"maths" => 43,
	"physics" => 54,
	"chemistry" => 65,
	"year" => 2016
},
{
	"id" => 2,
	"department" => "a1",
	"maths" => 66,
	"physics" => 52,
	"chemistry" => 65,
	"year" => 2016
},
{
	"id" => 3,
	"department" => "a7",
	"maths" => 87,
	"physics" => 32,
	"chemistry" => 43,
	"year" => 2016
},
{
	"id" => 1,
	"department" => "a1",
	"maths" => 21,
	"physics" => 52,
	"chemistry" => 65,
	"year" => 2015
},
{
	"id" => 2,
	"department" => "a1",
	"maths" => 68,
	"physics" => 50,
	"chemistry" => 65,
	"year" => 2015
},
{
	"id" => 3,
	"department" => "a7",
	"maths" => 85,
	"physics" => 22,
	"chemistry" => 43,
	"year" => 2015
},
{
	"id" => 4,
	"department" => "a7",
	"maths" => 21,
	"physics" => 22,
	"chemistry" => 13,
	"year" => 2016
}
]
new_students= []

puts "GROUP BY: id/department/year"
g = gets.chomp 

puts "SORT BY: maths/physics/chemistry"
s = gets.chomp 

puts "Display fields: maths,physics,chemistry"
d = gets.chomp 

dis_arr = d.split(",")

puts "Year: 2015/2016"
y = gets.chomp.to_i

puts "Should compare? true/false"
sc = gets.chomp

if sc == 'true'
puts "Should total? true/false"
t = gets.chomp
end

test1 = students.group_by {|x| x[g] }
if sc != 'true'
# puts "\n--------------------------Example 1-----------------------------------------"
test1.each do |key,value|
	
	value.each do |k,v|
		new_students << k if k['year'] == y
	end 
end
students_arr =  new_students.sort{|a,b| a['s']<=>b['s']}.reverse
dis_arr.each do |x|
	print "#{x}\t\t\t"
end
puts "\n"
i = 0
students_arr.each do |key,value|
	
	dis_arr.each do|x|
		print "#{key[x]}\t\t\t"
	end
	puts "\n"
end
else
test1.each do |key,value|
	if value[1].nil?
	 	value[1]= {}
	 	value[1]['maths'] = 0
	 	value[1]['physics'] = 0
	 	value[1]['chemistry'] = 0
    end
	 test1[key] = value.sort{|a,b| a['s']<=>b['s']}
end
# puts "\n--------------------------Example 2-----------------------------------------"
dis_arr.push('year')
dis_arr.insert(0, 'id')
dis_arr.each do |x|
	print "#{x}\t\t\t"
end
print "\n"
test1.each do |key, value|
	value.each do |k,v|
		dis_arr.each do |x|
			print "#{k[x]}\t\t\t" if k[x] != 0 
		end
		puts "\n" if value[1][0] != 0
	end
	student_maths = ((value[0]['maths']-value[1]['maths']).abs*100)/value[0]['maths']
	student_physics = ((value[0]['physics']-value[1]['physics']).abs*100)/value[0]['physics']
	student_chemistry = ((value[0]['chemistry']-value[1]['chemistry']).abs*100)/value[0]['chemistry']
	maths_total = value[0]['maths']+value[1]['maths']
	physics_total = value[0]['physics']+value[1]['physics']
	chemistry_total = value[0]['chemistry']+value[1]['chemistry']
	print "\nTotal\t\t\t #{maths_total}\t\t\t#{physics_total}\t\t\t#{chemistry_total}\t\t\t \n" if t == 'true'
	print "Change\t\t\t #{student_maths}%\t\t\t#{student_physics}%\t\t\t#{student_chemistry}%\t\t\t \n"
end

end
