install.packages("jsonlite", repos="https://cran.rstudio.com/")
library("jsonlite")

json_file <- 'https://datahub.io/core/covid-19/datapackage.json'
json_data <- fromJSON(paste(readLines(json_file), collapse=""))

# get list of all resources:
print(json_data$resources$name)

## print all tabular data(if exists any)
# for(i in 1:length(json_data$resources$datahub$type)){
#   if(json_data$resources$datahub$type[i]=='derived/csv'){
#     path_to_file = json_data$resources$path[i]
#     data <- read.csv(url(path_to_file))
#     print(data)
#   }
# }

##### Start of Analysis

# Viewing data
json_data$resources$path

#Extraction of datasets
time_series_combined=read.csv(url(json_data$resources$path[2]))
countries_aggregated=read.csv(url(json_data$resources$path[4]))
worldwide_aggregated=read.csv(url(json_data$resources$path[5]))

#developing_countries=read.csv(url("https://github.com/Quendie/Covid-19/blob/master/developing_countries.csv"))
developing_countries=read.csv("/Users/Jasmin/Documents/Covid-19/developing_countries.csv")

#plot(worldwide_aggregated$Date, worldwide_aggregated$Confirmed)
#points(worldwide_aggregated$Date, worldwide_aggregated$Deaths, col="red")

#control of names in list of developing countries with covid country names
dev_cont=unlist(developing_countries$ï..Country)
aggre= unlist(countries_aggregated$Country)

#countries not within covid 19 dataset
filtered_countries=setdiff(dev_cont, aggre)
print(filtered_countries)

#developed countries
filtered_countries2=setdiff(aggre, dev_cont)
print(filtered_countries2)
filtered_countries2=filtered_countries2[-60]
print(filtered_countries2)



dates=unique(countries_aggregated$Date)
dates=vapply(dates, paste, collapse = ", ", character(1L))

for(i in dates){
  cases_1=0
  cases_2=0
  for (j in seq_along(countries_aggregated$Date)){
    if(i==countries_aggregated$Date[j]){
      for(country in developing_countries$ï..Country){
        
        if(countries_aggregated$Country[j]==country){
          #print(countries_aggregated$Confirmed[j])
          cases_1=cases_1+countries_aggregated$Confirmed[j]
          #print(paste("cases1   ", cases_1))
        }
      }
      for(country in filtered_countries2){
        
        if(countries_aggregated$Country[j]==country){
          #print(countries_aggregated$Confirmed[j])
          cases_2=cases_2+countries_aggregated$Confirmed[j]
          #print(paste("cases2   ",cases_2))
        }
      }
      
    }
  }
  if(dates[1]==i){
    plot(as.Date(i), cases_1 , pch=20 , xlim =c(as.Date(dates[1]) , as.Date(dates[length(dates)])), ylim = c(0,8000000), ylab=" ", main = "Confirmed cases", xlab = "Date")
    legend("bottomright",legend=c("Developing countries", "Developed countries"),col=c("black", "blue"), pch=c(20,20))
    points(as.Date(i), cases_2, col="blue", pch=20)
  }
  else{
    points(as.Date(i), cases_1, pch=20)
    points(as.Date(i), cases_2, col="blue", pch=20)
  }
}




for(i in dates){
  cases_1=0
  cases_2=0
  for (j in seq_along(countries_aggregated$Date)){
    if(i==countries_aggregated$Date[j]){
      for(country in developing_countries$ï..Country){
        
        if(countries_aggregated$Country[j]==country){
          #print(countries_aggregated$Deaths[j])
          cases_1=cases_1+countries_aggregated$Deaths[j]
          #print(paste("cases1   ", cases_1))
        }
      }
      for(country in filtered_countries2){
        
        if(countries_aggregated$Country[j]==country){
          #print(countries_aggregated$Deaths[j])
          cases_2=cases_2+countries_aggregated$Deaths[j]
          #print(paste("cases2   ",cases_2))
        }
      }
      
    }
  }
  if(dates[1]==i){
    plot(as.Date(i), cases_1, pch=20 , xlim =c(as.Date(dates[1]), as.Date(dates[length(dates)])), ylim = c(0,450000), ylab=" ", main = "Deaths", xlab = "Date")
    legend("bottomright",legend=c("Developing countries", "Developed countries"),col=c("black", "blue"), pch=c(20,20))
    points(as.Date(i), cases_2, col="blue", pch=20)
  
  }
  else{
    points(as.Date(i), cases_1, pch=20)
    points(as.Date(i), cases_2, col="blue", pch=20)
  }
}




for(i in dates){
  cases_1=0
  cases_2=0
  for (j in seq_along(countries_aggregated$Date)){
    if(i==countries_aggregated$Date[j]){
      for(country in developing_countries$ï..Country){
        
        if(countries_aggregated$Country[j]==country){
          #print(countries_aggregated$Recovered[j])
          cases_1=cases_1+countries_aggregated$Recovered[j]
          #print(paste("cases1   ", cases_1))
        }
      }
      for(country in filtered_countries2){
        
        if(countries_aggregated$Country[j]==country){
          #print(countries_aggregated$Recovered[j])
          cases_2=cases_2+countries_aggregated$Recovered[j]
          #print(paste("cases2   ",cases_2))
        }
      }
      
    }
  }
  if(dates[1]==i){
    plot(as.Date(i), cases_1, pch=20 , xlim =c(as.Date(dates[1]),  as.Date(dates[length(dates)])), ylim = c(0,3000000),ylab=" ", main = "Recovered cases", xlab = "Date")
    legend("bottomright",legend=c("Developing countries", "Developed countries"),col=c("black", "blue"), pch=c(20,20))
    points(as.Date(i), cases_2, col="blue", pch=20)
  }
  else{
    points(as.Date(i), cases_1, pch=20)
    points(as.Date(i), cases_2, col="blue", pch=20)
  }
}




