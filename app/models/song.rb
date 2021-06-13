class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name) # create the setter method
    self.artist = Artist.find_or_create_by(name: name)
    # sets the artist to the artist of the specified name
  end

  def artist_name
    if self.artist
      self.artist.name
      # returns that name
    end
  end

  def genre_name=(genre) # for genre too
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != "" #cant allow blanks
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
    # this is the same as self.notes.map { |n| n.content }
  end



end
