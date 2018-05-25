class Book
    attr_accessor :file,:name,:author,:pages,:currentPage,:currentPageNumber,:bookMarks
    def createBook(filePath)
        return false unless File.file?(filePath)
        @file = File.read(filePath)
        populatePages()
        @bookMarks = Array.new
    end

    def populatePages()
        @pages = Array.new
        words = @file.split(" ")
        page=""
        while words.size>0 do
            word = words.shift
            tempPage = page.lstrip + " " + word
            if tempPage.size > 10 then
                words.unshift(word)
                @pages.push(page)
                page = ""
            else
                page=tempPage.lstrip
            end
        end
        @pages.push(page) unless page.size == 0
    end
    def getPage(number)
        if @pages.size >= number then
            @currentPage = @pages[number-1]
            @currentPageNumber = number
            return @currentPage.to_s + "\n======= page number " + @currentPageNumber.to_s + " ========"
        elsif @pages.size > 0
            return "Invalid page number"
        else
            return "\nNo pages in the book"
        end
    end
    def getCurrentPage()
        if @currentPage then
            return @currentPage.to_s + "\n======= page number " + @currentPageNumber.to_s + " ========"
        else
            return getFirstPage()
        end
    end
    def skipPages(number)
        if @currentPage then
            return getPage(@currentPageNumber + number+1)
        else
            return getFirstPage()
        end
    end
    def bookMarkPage()
        getFirstPage() unless @currentPage
        @bookMarks.push(@currentPageNumber) unless 
        @bookMarks.include? @currentPageNumber
    end

    def getBookmarks()
        return @bookMarks
    end

    def getPagesNumber()
        return @pages.size 
    end
    def getFirstPage()
        return getPage(1)
    end
    def getLastPage()
        return getPage(getPagesNumber())
    end

    def Read(page)
        return file
    end

end
book = Book.new
book.createBook("text.out")
book.bookMarkPage()
book.getFirstPage()
book.bookMarkPage()
book.skipPages(1)
book.bookMarkPage()
book.getCurrentPage()
book.bookMarkPage()

puts book.getBookmarks()