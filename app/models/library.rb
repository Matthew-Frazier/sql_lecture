class Library < ApplicationRecord
  has_many :customers
  has_many :books

  # def self.books_per_library
  #   # Active Record Way
  #   # Book.select(libraries.name).join(libraries: :books)

  #   # Active Record Mixed with SQL
  #   Book.select("libraries.name, COUNT(books.id) AS book_count")
  #     .joins("LEFT JOIN libraries ON libraries.id = books.library_id")
  #     .group("libraries.name")
  #     # Active Record Method for ORDER BY, SQL and AR can be mixed and matched in a query
  #     .order(book_count: :desc)
  #     # .order("book_count DESC") AR-SQL mix way of doing ORDER BY
  # end

  def self.books_per_library
    find_by_sql(["
      SELECT libraries.name, count(books.id) AS book_count 
      FROM books 
      LEFT JOIN libraries ON libraries.id = books.library_id
      GROUP BY libraries.name
      ORDER BY book_count DESC
    "])
  end
end
