module EventsHelper
  def events_ajax_previous_link
    ->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, remote: :true}
  end

  def events_ajax_next_link
    ->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, remote: :true}
  end

  def colorize(object)
    # Inspired by Jeremy Ruten (http://stackoverflow.com/questions/1698318/ruby-generate-a-random-hex-color)
    hash = object.hash # hash an object, returns a Fixnum
    trimmed_hash = hash*2 & 0xffffff # trim the hash to the size of 6 hex digits (& is bit-wise AND)
    hex_code = "%06x" % trimmed_hash # format as at least 6 hex digits, pad with zeros
    "##{hex_code}"
  end
end
