def format_duration(seconds)
  hours = seconds / 3600
  minutes = (seconds - (hours * 3600)) / 60
  remainingSeconds = seconds - (hours * 3600) - (minutes * 60)

  hoursPart = ''
  hoursPart = case hours
              when 0
                ''
              when 1
                hours.to_s + ' hour'
              else
                hours.to_s + ' hours'
              end

  minutesPart = ''
  minutesPart = case minutes
                when 0
                  ''
                when 1
                  minutes.to_s + ' minute'
                else
                  minutes.to_s + ' minutes'
                end

  secondsPart = ''
  secondsPart = case remainingSeconds
                when 0
                  ''
                when 1
                  remainingSeconds.to_s + ' second'
                else
                  remainingSeconds.to_s + ' seconds'
                end

  hoursPart + (hours > 0 && minutes > 0 ? ', ' : '') + minutesPart + (minutes > 0 && remainingSeconds > 0 ? ' and ' : '') + secondsPart
end
