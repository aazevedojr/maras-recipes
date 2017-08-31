module RecipesHelper


  # convert prep_time(minutes) to "hour(s), minute(s)" format
  def time_converter(time_in_minutes)
    hours = time_in_minutes / 60
    minutes = time_in_minutes % 60
    hours_string = ""
    minutes_string = ""

    # format hour
    hours == 1 ? (hours_string = "1 hour") : (hours_string = "#{hours} hours")

    # format minute
    minutes == 1 ? (minutes_string = "1 minute") : (minutes_string = "#{minutes} minutes")

    # format and return with ',' separator (if necessary)
    if minutes > 0 && hours == 0
    	"#{minutes_string}"
    elsif minutes == 0 && hours > 0
    	"#{hours_string}"
    else
    	"#{hours_string}, #{minutes_string}"
    end
  end

end
