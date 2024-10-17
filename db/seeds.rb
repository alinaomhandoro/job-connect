# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning db"
JobApplication.destroy_all
Job.destroy_all
User.destroy_all



user1 = User.create!(email: "max@gmail.com", password: "123456")
user2 = User.create!(email: "alex@gmail.com", password: "123456")

puts "Creating job..."
first_job = Job.new(job_title:"IT Specialist", company_name:"BASF", company_description:"BASF is the world's leading chemical company, offering a wide range of products and solutions to meet the needs of various industries.", company_size:112.132, location:"Ludwigshafen, Germany", job_description:"Provide technical support and problem-solving for BASF's IT systems and infrastructure. Maintain and troubleshoot network, server, and application environments. Implement and support IT security measures to protect sensitive data. Collaborate with cross-functional teams to deliver efficient and effective IT solutions. Stay updated on emerging technologies and industry best practices.", salary:58.222, user_id:user1.id)
first_job.save!
second_job = Job.new(job_title:"IT Project Manager", company_name:"ARM Holdings", company_description:"ARM Holdings is a prominent IT company from the UK. It designs and licenses semiconductor IP, including the widely used ARM architecture, which is used in a vast majority of smartphones and tablets worldwide.", company_size:31.285, location:"Cambridge, England", job_description:"Arm Holdings is seeking an experienced IT Project Manager to lead and coordinate complex IT projects, ensuring successful delivery within budget and timeline while meeting project objectives and adhering to quality standards.", salary:52.378, user_id:user2.id)
second_job.save!
second_job = Job.new(job_title:"Full Stack Web Developer", company_name:"IBM", company_description:"IBM is a global technology company that provides hardware, software, cloud-based services, and artificial intelligence solutions.", company_size:305.312, location:"Cambridge, England", job_description:"IBM is seeking a Full Stack Web Developer to join our team. The ideal candidate will have a strong foundation in front-end and back-end development, as well as experience with cloud-based technologies and Agile methodologies.", salary:70.345, user_id:user1.id)
second_job.save!
second_job = Job.new(job_title:"Front-end", company_name:"Google", company_description:"Google is a multinational technology company that primarily focuses on online advertising, search engine technology, cloud computing, and artificial intelligence ", company_size:179.582, location:"California, USA", job_description:"Front-end position available. Candidates should have proficiency in HTML, CSS, JavaScript and Ruby on rails", salary:42.529, user_id:user2.id)
second_job.save!
second_job = Job.new(job_title:"Back-end", company_name:"Meta", company_description:"Meta (formerly Facebook) is a technology company that specializes in social networking and online communication", company_size:70.799, location:"California, USA", job_description:"Meta is seeking a talented Back-end Engineer to join our team and help build the next generation of social networking platforms. As a Back-end Engineer, you will be responsible for designing, developing, and maintaining scalable and reliable systems that power our billions of users. You will work closely with a team of talented engineers to build innovative solutions that solve complex problems at scale.", salary:55.781, user_id:user1.id)
second_job.save!



puts "Creating applications"

application1 = JobApplication.create!(status:"pending", interview_outcome: "in Progress", interview_completion:"false", interview_date: "20/10/2024", user_id: user1.id, job_id: first_job.id)
application2 = JobApplication.create!(status:"confirmed", interview_outcome: "complete", interview_completion:"true", interview_date: "10/10/2024", user_id: user1.id, job_id: second_job.id)
application3 = JobApplication.create!(status:"pending", interview_outcome: "in Progress", interview_completion:"false", interview_date: "20/10/2024", user_id: user2.id, job_id: first_job.id)
application4 = JobApplication.create!(status:"confirmed", interview_outcome: "complete", interview_completion:"true", interview_date: "10/10/2024", user_id: user2.id, job_id: second_job.id)


puts "Seed created! #{User.all.count} users created & #{Job.all.count} jobs created & #{JobApplication.all.count} applications created"
