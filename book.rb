class Book
  attr_accessor :file, :name, :author, :pages, :currentPage, :currentPageNumber, :bookMarks
  def createBook(filePath)
    return false unless File.file?(filePath)
    @file = File.read(filePath)
    populatePages
    @bookMarks = []
  end

  def populatePages
    @pages = []
    words = @file.split(' ')
    page = ''
    until words.empty?
      word = words.shift
      tempPage = page.lstrip + ' ' + word
      if tempPage.size > 10
        words.unshift(word)
        @pages.push(page)
        page = ''
      else
        page = tempPage.lstrip
      end
    end
    @pages.push(page) unless page.empty?
  end

  def getPage(number)
    if @pages.size >= number
      @currentPage = @pages[number - 1]
      @currentPageNumber = number
      @currentPage.to_s + "\n======= page number " + @currentPageNumber.to_s + ' ========'
    elsif !@pages.empty?
      'Invalid page number'
    else
      "\nNo pages in the book"
    end
  end

  def getCurrentPage
    if @currentPage
      @currentPage.to_s + "\n======= page number " + @currentPageNumber.to_s + ' ========'
    else
      getFirstPage
    end
  end

  def skipPages(number)
    if @currentPage
      getPage(@currentPageNumber + number + 1)
    else
      getFirstPage
    end
  end

  def bookMarkPage
    getFirstPage unless @currentPage
    @bookMarks.push(@currentPageNumber) unless
    @bookMarks.include? @currentPageNumber
  end

  def getBookmarks
    @bookMarks
  end

  def getPagesNumber
    @pages.size
  end

  def getFirstPage
    getPage(1)
  end

  def getLastPage
    getPage(getPagesNumber)
  end

  def Read(_page)
    file
  end
end
book = Book.new
book.createBook('text.out')
book.bookMarkPage
book.getFirstPage
book.bookMarkPage
book.skipPages(1)
book.bookMarkPage
book.getCurrentPage
book.bookMarkPage

puts book.getBookmarks
