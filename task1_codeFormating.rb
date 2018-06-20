def format_duration(seconds)
  hours = seconds / 3600
  minutes = (seconds - (hours * 3600)) / 60
  remaining_seconds = seconds - (hours * 3600) - (minutes * 60)

  hours_part = ''
  hours_part = case hours
               when 0
                 ''
               when 1
                 hours.to_s + ' hour'
               else
                 hours.to_s + ' hours'
              end

  minutes_part = ''
  minutes_part = case minutes
                 when 0
                   ''
                 when 1
                   minutes.to_s + ' minute'
                 else
                   minutes.to_s + ' minutes'
                end

  seconds_part = ''
  seconds_part = case remainingSeconds
                 when 0
                   ''
                 when 1
                   remainingSeconds.to_s + ' second'
                 else
                   remainingSeconds.to_s + ' seconds'
                end

  hoursPart + (hours > 0 && minutes > 0 ? ', ' : '') + minutes_part + (minutes > 0 && remaining_seconds > 0 ? ' and ' : '') + seconds_part
end
