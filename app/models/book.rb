class Book < ApplicationRecord
  belongs_to :library
  has_many :logs
  has_many :customers, through: :logs

  def self.top_genre
    find_by_sql(["
      SELECT genre, COUNT(logs.id) AS total_rentals
      FROM logs
      INNER JOIN books ON books.id = logs.book_id
      GROUP BY genre
      ORDER BY total_rentals DESC
      LIMIT 5
    "])
  end
end
