class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



def scrape_darksky

require "rubygems"
require "json"
require 'nokogiri'
require 'open-uri'




resorts = {
  
  :Niseko => [42.864462,140.701598],
  :Rusutsu => [42.739169,140.910508],
  :Furano => [43.329196,142.337712],
  :Kiroro => [43.075914,140.982185],
  
  :Hakuba => [36.702350,137.832192],
  :Nozawa_Onsen => [36.920301,138.451982],
  :Shiga_Kogen => [36.767651,138.514797],
  :Myoko_Kogen => [36.887204,138.177576],
  
  :YongPyong => [37.643422,128.680311],
  :Alpensia => [37.654394,128.671719],
  :Phoenix_Snow_Park => [37.574514,128.322196],
  :High1_Resort => [37.205229,128.839780],
  :Vivaldi_Park => [37.643741,127.683793],
  
  :Yabuli => [44.781119,128.447592],
  :Beidahu => [43.471269,126.493526], #took ski field
  :Changbaishan => [42.102153,127.505355],
  :Chongli => [40.975317,115.282733]
  
  # Uncomment below to test melbourne (no precipAccumulation in JSON) 
  # for potential issues when precipAccumulation is not present in JSON
  # https://api.darksky.net/forecast/979b169b4243ddb0a2ea22801e966bd0/-37.8136,144.9631
  #,:Melbourne => [-37.8136,144.9631]
  # No issues in controller -> @Melbourne and @Melbourne_today return Nil
  # Assuming no issues in view

  
  }

# This works resorts[:Niseko]



# me: 979b169b4243ddb0a2ea22801e966bd0
# ted: ed754b881023885f03ee8940a84b50cd
# this generates urls programmatically and stores them as instance variables e.g. @Niseko_url (note the upper case first letter - exact same as symbols in resorts hash)
resorts.each { |resort, coords|  instance_variable_set("@#{resort}" + "_url", 
	"https://api.darksky.net/forecast/979b169b4243ddb0a2ea22801e966bd0/" + 
	coords[0].to_s + "," + coords[1].to_s)  }     


# takes around 20 seconds - ouch
resorts.each { |resort, coords|  instance_variable_set("@#{resort}" + "_data", JSON.parse(Nokogiri::HTML(open(instance_variable_get("@#{resort}" + "_url"))))) } 


# create final instance variables for the view
# Currently returns "cannot coerce Nil to float error" # .to_f.round(1)
resorts.each { |resort, coords|  
	instance_variable_set("@#{resort}" + "_today", ((instance_variable_get("@#{resort}" + "_data")["daily"]["data"][0]["precipAccumulation"].to_f * 2.54).round(1)) ) 
    instance_variable_set("@#{resort}" + "_tomorrow",   ((instance_variable_get("@#{resort}" + "_data")["daily"]["data"][1]["precipAccumulation"].to_f * 2.54).round(1) )) 
    instance_variable_set("@#{resort}" + "_three_day",   ((instance_variable_get("@#{resort}" + "_data")["daily"]["data"][1]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][2]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][3]["precipAccumulation"].to_f) * 2.54).round(1)) 
    instance_variable_set("@#{resort}" + "_seven_day",   ((instance_variable_get("@#{resort}" + "_data")["daily"]["data"][1]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][2]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][3]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][4]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][5]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][6]["precipAccumulation"].to_f + instance_variable_get("@#{resort}" + "_data")["daily"]["data"][7]["precipAccumulation"].to_f) * 2.54).round(1) ) 
} 




##### LINE FOR MODEL CREATION
# niseko_today:float niseko_tomorrow:float niseko_three_day:float niseko_seven_day:float rusutsu_today:float rusutsu_tomorrow:float rusutsu_three_day:float rusutsu_seven_day:float furano_today:float furano_tomorrow:float furano_three_day:float furano_seven_day:float kiroro_today:float kiroro_tomorrow:float kiroro_three_day:float kiroro_seven_day:float hakuba_today:float hakuba_tomorrow:float hakuba_three_day:float hakuba_seven_day:float nozawa_onsen_today:float nozawa_onsen_tomorrow:float nozawa_onsen_three_day:float nozawa_onsen_seven_day:float shiga_kogen_today:float shiga_kogen_tomorrow:float shiga_kogen_three_day:float shiga_kogen_seven_day:float myoko_kogen_today:float myoko_kogen_tomorrow:float myoko_kogen_three_day:float myoko_kogen_seven_day:float yongpyong_today:float yongpyong_tomorrow:float yongpyong_three_day:float yongpyong_seven_day:float alpensia_today:float alpensia_tomorrow:float alpensia_three_day:float alpensia_seven_day:float phoenix_snow_park_today:float phoenix_snow_park_tomorrow:float phoenix_snow_park_three_day:float phoenix_snow_park_seven_day:float high1_resort_today:float high1_resort_tomorrow:float high1_resort_three_day:float high1_resort_seven_day:float vivaldi_park_today:float vivaldi_park_tomorrow:float vivaldi_park_three_day:float vivaldi_park_seven_day:float yabuli_today:float yabuli_tomorrow:float yabuli_three_day:float yabuli_seven_day:float beidahu_today:float beidahu_tomorrow:float beidahu_three_day:float beidahu_seven_day:float changbaishan_today:float changbaishan_tomorrow:float nchangbaishan_three_day:float changbaishan_seven_day:float chongli_today:float chongli_tomorrow:float chongli_three_day:float chongli_seven_day:float




Condition.create(
         niseko_today: @Niseko_today,
         niseko_tomorrow: @Niseko_tomorrow,
         niseko_three_day: @Niseko_three_day,
         niseko_seven_day: @Niseko_seven_day,
         rusutsu_today: @Rusutsu_today,
         rusutsu_tomorrow: @Rusutsu_tomorrow,
         rusutsu_three_day: @Rusutsu_three_day,
         rusutsu_seven_day: @Rusutsu_seven_day,
         furano_today: @Furano_today,
         furano_tomorrow: @Furano_tomorrow,
         furano_three_day: @Furano_three_day,
         furano_seven_day: @Furano_seven_day,
         kiroro_today: @Kiroro_today,
         kiroro_tomorrow: @Kiroro_tomorrow,
         kiroro_three_day: @Kiroro_three_day,
         kiroro_seven_day: @Kiroro_seven_day,
         hakuba_today: @Hakuba_today,
         hakuba_tomorrow: @Hakuba_tomorrow,
         hakuba_three_day: @Hakuba_three_day,
         hakuba_seven_day: @Hakuba_seven_day,
         nozawa_onsen_today: @Nozawa_Onsen_today,
         nozawa_onsen_tomorrow: @Nozawa_Onsen_tomorrow,
         nozawa_onsen_three_day: @Nozawa_Onsen_three_day,
         nozawa_onsen_seven_day: @Nozawa_Onsen_seven_day,
         shiga_kogen_today: @Shiga_Kogen_today,
         shiga_kogen_tomorrow: @Shiga_Kogen_tomorrow,
         shiga_kogen_three_day: @Shiga_Kogen_three_day,
         shiga_kogen_seven_day: @Shiga_Kogen_seven_day,
         myoko_kogen_today: @Myoko_Kogen_today,
         myoko_kogen_tomorrow: @Myoko_Kogen_tomorrow,
         myoko_kogen_three_day: @Myoko_Kogen_three_day,
         myoko_kogen_seven_day: @Myoko_Kogen_seven_day,
         yongpyong_today: @Yongpyong_today,
         yongpyong_tomorrow: @Yongpyong_tomorrow,
         yongpyong_three_day: @Yongpyong_three_day,
         yongpyong_seven_day: @Yongpyong_seven_day,
         alpensia_today: @Alpensia_today,
         alpensia_tomorrow: @Alpensia_tomorrow,
         alpensia_three_day: @Alpensia_three_day,
         alpensia_seven_day: @Alpensia_seven_day,
         phoenix_snow_park_today: @Phoenix_Snow_Park_today,
         phoenix_snow_park_tomorrow: @Phoenix_Snow_Park_tomorrow,
         phoenix_snow_park_three_day: @Phoenix_Snow_Park_three_day,
         phoenix_snow_park_seven_day: @Phoenix_Snow_Park_seven_day,
         high1_resort_today: @High1_Resort_today,
         high1_resort_tomorrow: @High1_Resort_tomorrow,
         high1_resort_three_day: @High1_Resort_three_day,
         high1_resort_seven_day: @High1_Resort_seven_day,
         vivaldi_park_today: @Vivaldi_Park_today,
         vivaldi_park_tomorrow: @Vivaldi_Park_tomorrow,
         vivaldi_park_three_day: @Vivaldi_Park_three_day,
         vivaldi_park_seven_day: @Vivaldi_Park_seven_day,
         yabuli_today: @Yabuli_today,
         yabuli_tomorrow: @Yabuli_tomorrow,
         yabuli_three_day: @Yabuli_three_day,
         yabuli_seven_day: @Yabuli_seven_day,
         beidahu_today: @Beidahu_today,
         beidahu_tomorrow: @Beidahu_tomorrow,
         beidahu_three_day: @Beidahu_three_day,
         beidahu_seven_day: @Beidahu_seven_day,
         changbaishan_today: @Changbaishan_today,
         changbaishan_tomorrow: @Changbaishan_tomorrow,
         changbaishan_three_day: @Changbaishan_three_day,
         changbaishan_seven_day: @Changbaishan_seven_day,
         chongli_today: @Chongli_today,
         chongli_tomorrow: @Chongli_tomorrow,
         chongli_three_day: @Chongli_three_day,
         chongli_seven_day: @Chongli_seven_day
  )







render template: 'scrape_darksky'

end




end


##### LINE FOR MODEL CREATION
# niseko_today:float niseko_tomorrow:float niseko_three_day:float niseko_seven_day:float rusutsu_today:float rusutsu_tomorrow:float rusutsu_three_day:float rusutsu_seven_day:float furano_today:float furano_tomorrow:float furano_three_day:float furano_seven_day:float kiroro_today:float kiroro_tomorrow:float kiroro_three_day:float kiroro_seven_day:float hakuba_today:float hakuba_tomorrow:float hakuba_three_day:float hakuba_seven_day:float nozawa_onsen_today:float nozawa_onsen_tomorrow:float nozawa_onsen_three_day:float nozawa_onsen_seven_day:float shiga_kogen_today:float shiga_kogen_tomorrow:float shiga_kogen_three_day:float shiga_kogen_seven_day:float myoko_kogen_today:float myoko_kogen_tomorrow:float myoko_kogen_three_day:float myoko_kogen_seven_day:float yongpyong_today:float yongpyong_tomorrow:float yongpyong_three_day:float yongpyong_seven_day:float alpensia_today:float alpensia_tomorrow:float alpensia_three_day:float alpensia_seven_day:float phoenix_snow_park_today:float phoenix_snow_park_tomorrow:float phoenix_snow_park_three_day:float phoenix_snow_park_seven_day:float high1_resort_today:float high1_resort_tomorrow:float high1_resort_three_day:float high1_resort_seven_day:float vivaldi_park_today:float vivaldi_park_tomorrow:float vivaldi_park_three_day:float vivaldi_park_seven_day:float yabuli_today:float yabuli_tomorrow:float yabuli_three_day:float yabuli_seven_day:float beidahu_today:float beidahu_tomorrow:float beidahu_three_day:float beidahu_seven_day:float changbaishan_today:float changbaishan_tomorrow:float nchangbaishan_three_day:float changbaishan_seven_day:float chongli_today:float chongli_tomorrow:float chongli_three_day:float chongli_seven_day:float






# A bit about instance_variable_get:
# From here: https://stackoverflow.com/questions/30840127/get-value-from-string-representing-local-variable
# eval("@Niseko_url")
# instance_variable_get("@Niseko_url")
# binding.local_variable_get("variable") - doesn't work here since we're dealing with an instance variable, not a local one






# ORIGINAL 
# url = "https://api.darksky.net/forecast/979b169b4243ddb0a2ea22801e966bd0/42.7925607,140.6145884"
# doc = Nokogiri::HTML(open(url))
# data = JSON.parse(doc)
# @today = (data["daily"]["data"][0]["precipAccumulation"]).round(1)
# @tomorrow = (data["daily"]["data"][1]["precipAccumulation"]).round(1)
# #three_day = data["daily"]["data"][0]["precipAccumulation"] + data["daily"]["data"][1]["precipAccumulation"] + data["daily"]["data"][2]["precipAccumulation"] 
# @three_day = (data["daily"]["data"][1]["precipAccumulation"] + data["daily"]["data"][2]["precipAccumulation"] + data["daily"]["data"][3]["precipAccumulation"]).round(1) 
# #seven_day = data["daily"]["data"][0]["precipAccumulation"] + data["daily"]["data"][1]["precipAccumulation"] + data["daily"]["data"][2]["precipAccumulation"] + data["daily"]["data"][3]["precipAccumulation"] + data["daily"]["data"][4]["precipAccumulation"] + data["daily"]["data"][5]["precipAccumulation"] + data["daily"]["data"][6]["precipAccumulation"]
# @seven_day = (data["daily"]["data"][1]["precipAccumulation"] + data["daily"]["data"][2]["precipAccumulation"] + data["daily"]["data"][3]["precipAccumulation"] + data["daily"]["data"][4]["precipAccumulation"] + data["daily"]["data"][5]["precipAccumulation"] + data["daily"]["data"][6]["precipAccumulation"] + data["daily"]["data"][7]["precipAccumulation"]).round(1)





