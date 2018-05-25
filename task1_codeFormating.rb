def format_duration(seconds)
  hours = seconds / 3600
  minutes = (seconds - (hours * 3600)) / 60
  remainingSeconds = seconds - (hours * 3600) - (minutes * 60)
  
  hoursPart = ""
  case hours
      when 0
        hoursPart = ""
      when 1
        hoursPart = hours.to_s + " hour"
      else
        hoursPart = hours.to_s + " hours"
  end
  
  minutesPart = ""
  case minutes
      when 0
        minutesPart = ""
      when 1
        minutesPart = minutes.to_s + " minute"
      else
        minutesPart = minutes.to_s + " minutes"
  end
  
  secondsPart = ""
  case remainingSeconds
      when 0
        secondsPart = ""
      when 1
        secondsPart = remainingSeconds.to_s + " second"
      else
        secondsPart = remainingSeconds.to_s + " seconds"
  end
  
  
  return  hoursPart + (hours>0 && minutes>0 ? ", " : "") + minutesPart + (minutes > 0 && remainingSeconds > 0 ? " and " : "") + secondsPart
end