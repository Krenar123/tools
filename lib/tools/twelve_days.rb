class TwelveDays 
    LYRIC = {
      'first' => " a Partridge in a Pear Tree.",
      'second' => " two Turtle Doves, and",
      'third' => " three French Hens,",
      'fourth' => " four Calling Birds,",
      'fifth' => " five Gold Rings,",
      'sixth' => " six Geese-a-Laying,",
      'seventh' => " seven Swans-a-Swimming,",
      'eighth' => " eight Maids-a-Milking,",
      'ninth' => " nine Ladies Dancing,",
      'tenth' => " ten Lords-a-Leaping,",
      'eleventh' => " eleven Pipers Piping,",
      'twelfth' => " twelve Drummers Drumming,"
  }
  def self.song
    str = ""
    arr = LYRIC.values
    i = -1
    LYRIC.each do |key, value|
        i += 1
        j = i
        f = ""
        while j >= 0 do
            f += arr[j]
            j -= 1
        end 
        str += key == 'twelfth' ? "On the #{key} day of Christmas my true love gave to me:"+f.to_s+"\n" : "On the #{key} day of Christmas my true love gave to me:"+f.to_s+"\n\n"
    end
    str
  end
end 