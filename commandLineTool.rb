require 'optparse'
require 'fileutils'
class TasksBook
    attr_accessor :file,:tasks,:filePath
    def createBook(filePath)
        @filePath = filePath
        return false unless File.file?(filePath)
        @file = File.readlines(filePath)
    end
    def getTasks()
        line_num=0
        @file.each do |line|
            print "#{line_num += 1}-#{line}"
        end
    end
    def addTask(str)
        @file = File.new(@filePath, "a")
        @file.puts str
        @file.close
    end
    def removeTasks(n)
        tempFilePath = @filePath+"temp"
        lineNumber = 1
        File.open(tempFilePath, "w") do |out_file|
            @file.each do |line|
              out_file.puts line unless lineNumber > n
              lineNumber+=1
            end
        end
        
        FileUtils.mv(tempFilePath, @filePath)
    end

    def removeLine(l)
        puts "removing line " + l.to_s
        tempFilePath = @filePath+"temp"
        lineNumber = 1
        File.open(tempFilePath, "w") do |out_file|
            @file.each do |line|
              out_file.puts line unless lineNumber == l
              lineNumber+=1
            end
        end
        
        FileUtils.mv(tempFilePath, @filePath)
    end

end
# This will hold the options we parse
options = {}

    OptionParser.new do |parser|
    parser.banner = "Usage: ruby.rb [options]"

    parser.on("-h", "--help", "Show this help message") do ||
        puts parser
    end

    parser.on("-a", "--add TASK",String, "Add new task.") do |v|
        options[:add] = v
    end

    parser.on("-r", "--remove TASK",Integer, "Removes the last n in the list.") do |v|
        options[:remove] = v
    end

    parser.on("-x", "--removeLine TASK",Integer, "Removes the line from the list.") do |v|
        options[:removeLine] = v
    end

    parser.on("-l", "--list", "List tasks") do |v|
        options[:list] = v
    end

    parser.on("-c", "--clear", "Clear the list") do |v|
        options[:clear] = v
    end
end.parse!

def InitializeBook()
    listBook = TasksBook.new
    listBook.createBook("text.out")
    return listBook
end

if options[:add]
    listBook = InitializeBook()
    listBook.addTask(options[:add])
end

if options[:list]
    listBook = InitializeBook()
    listBook.getTasks()
end

if options[:remove]
    listBook = InitializeBook()
    listBook.removeTasks(options[:remove])
end

if options[:clear]
    listBook = InitializeBook()
    listBook.removeTasks(0)
end

if options[:removeLine]
    listBook = InitializeBook()
    listBook.removeLine(options[:removeLine])
end
