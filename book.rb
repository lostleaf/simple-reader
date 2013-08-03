class Book

    def self.get_book book_id
        self.new(all[book_id])
    end

    def self.all
        Dir.glob("books/*").inject([]) do |arr, file| 
            arr << file.split('/')[-1] if File.directory? file
        end
    end

    def initialize(book_name)
      @book_name = book_name
    end

    def chapters
        Dir.glob("books/#{@book_name}/*").inject([]) {|arr, file| arr << file.split('/')[-1] }
    end

    def get_content chapter_id
        File.read("books/#{@book_name}/#{chapters[chapter_id]}")
    end
end