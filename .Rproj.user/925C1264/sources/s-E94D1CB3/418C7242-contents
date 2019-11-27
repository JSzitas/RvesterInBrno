# an rvest in Brno 
library(tidyverse)
library(rvest)
library(xlsx)
source(here::here('rvesting_fun.R'))
source(here::here('placeholder.R'))

# the html_identifiers work in the following fashion to create a data vector with the 
# html placeholders for our features, consituting of a placeholder for 
# 1 - location (where the place is)
# 2 - street 
# 3 - price
# 4 - information on whether its a flat
# 5 - or whether its a room 
# 6 - what kind of a dwelling it is ( ie 3+1, 2+kk, 1+kk,...)
# 7 - is it a garsoniery? 
# 8 - what is the square metres of the place? 
# 9 - the full text box - this need not necessarily be well defined, 
# this is just to inform the reader
  housing_1 <- brno_houseprice_tool(site = site_link_1,
                                    html_identifier = html_objects_1,
                                    num_of_pages = 12,
                                    bottle_neck = 1)


housing_2 <- brno_houseprice_tool(site = site_link_2,
                                  html_identifier = html_objects_2,
                                  num_of_pages = 17)

  
housing_3 <- brno_houseprice_tool(site = site_link_3,
                                  html_identifier = html_objects_3,
                                  num_of_pages = 21)  
housing_4 <- brno_houseprice_tool(site = site_link_4,
                                  html_identifiers = html_objects_4,
                                  num_of_pages = 9,
                                  site_chaser = site_chaser_4,
                                  bottle_neck = 1)
housing_5 <- brno_houseprice_tool(site = site_link_5,
                                  html_identifiers = html_objects_5,
                                  num_of_pages = 3,
                                  site_chaser = site_chaser_5,
                                  square_format_is_fucked = T,
                                  sqr_format_key = 'osob')

housing_9_7_2019 <- rbind(housing_1,
                          housing_2,
                          housing_3,
                          housing_5)

write.xlsx(housing_9_7_2019,
           "housing_9_7_2019.xlsx")
