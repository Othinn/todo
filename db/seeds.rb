# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create( username: 'user1', email: 'user1@gmail.com', password: 'password')
project1 = Project.create(project_name: 'Making html page', user_id: user1.id)
task1 = Task.create(task_name: 'Navbar',
                    deadline: '19-08-2018 17:00',
                    project_id: project1.id, priority: 3 )
task2 = Task.create(task_name: 'Header',
                    deadline: '09/08/2018 17:00',
                    project_id: project1.id, priority: 2 )
task3 = Task.create(task_name: 'Footer',
                    deadline: '29/08/2018 17:00',
                    project_id: project1.id, priority: 1 )
task4 = Task.create(task_name: 'Body',
                    deadline: '14/08/2018 17:00',
                    project_id: project1.id, priority: 2 )
5.times do
  Comment.create(content: 'bootsrap', task_id: task1.id)
end

