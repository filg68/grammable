puts "1. Standard git update"
puts "2. Heroku git update"
puts "3. git status"
puts "4. git log --oneline"
puts "5. run test suite"
puts "Type q(uit) to exit"

choice=gets.chomp
  case choice
    when 1
	mgs=gets.chomp
	system "bash lazy_git #{msg}"
    when 2
	system "git push heroku master"
    when 3
	system "git status"
    when 4
	system "git log --oneline"
    when 5
        system "bash run_tests"
    when :q
        # break
	system 'echo quitting'
   end

