require 'time'

agora = Time.now

dias = (     agora.day).to_s
horas = (    agora.hour).to_s
minutos = (  agora.min).to_s
segundos = ( agora.sec).to_s
meses = (    agora.mon).to_s
anos = (     agora.year).to_s

puts *["dias: "+dias, "horas: "+horas, "minutos: "+minutos, "segundos: "+segundos, "meses: "+meses, "anos: "+anos]