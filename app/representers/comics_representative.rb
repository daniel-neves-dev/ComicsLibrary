class ComicsRepresentative
  def initialize(comics)
    @comics = comics
  end

  def as_json
    @comics.map do |comic|
      {
        id: comic.id,
        title: comic.title,
        author_name: author_name(comic),
        author_age: comic.author.age
      }
    end
  end

  private

  attr_reader :comics

  def author_name(comic)
    "#{comic.author.first_name} #{comic.author.last_name}"
  end
end
