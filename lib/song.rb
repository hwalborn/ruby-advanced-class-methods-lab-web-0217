require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.all << self.new
    self.all[0]
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    self.all << new_song
    new_song
  end

  def self.find_by_name(song)
    self.all.detect{|title| title.name == song}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    artist = file.split(" - ")[1]
    song = self.new
    song.artist_name = file.split(" - ")[0]
    song.name = artist.split(".")[0]
    song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
