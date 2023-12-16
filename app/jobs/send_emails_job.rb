class SendEmailsJob < ApplicationJob
  queue_as :default
  def perform(arg1,arg2)
    @mult=arg1*arg2
    puts "multiplication is : #{@mult}"
  
  end

  queue_as :high_priority
  def perform(arg1,arg2,arg3,arg4)
    puts "arguments are #{arg1} ,#{arg2}, #{arg3} ,#{arg4}"
  end
  queue_as :high_priority
  def perform(arg1,arg2,arg3,arg4,arg5)
    puts "arguments are #{arg1} ,#{arg2}, #{arg3} ,#{arg4},#{arg5}"
  end
  
end
