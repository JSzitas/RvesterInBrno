# the main harvest solution

brno_houseprice_tool <- function(site,
                                 html_identifiers,
                                 num_of_pages,
                                 site_chaser = NULL,
                                 bottle_neck = 0.2,
                                 fix_awful_formatting = F,
                                 square_format_is_wrong = F,
                                 sqr_format_key = NULL,
                                 the_street_is_wrong = F,
                                 fix_street_by_pattern = NULL){
  final <- list()
  for (i in c(1:num_of_pages))
  {
    grab_html <- read_html(str_c(site,i,site_chaser))

    miesto <- grab_html %>%
      html_nodes(html_identifiers[1]) %>%
      html_text() %>%
      str_to_lower() %>%
      str_extract('(?<=(brno - )).+|(?<=(brno-)).+')


    if(the_street_is_wrong==T){
      ulica <- grab_html %>%
        html_nodes(html_identifiers[2]) %>%
        html_text() %>%
        str_to_lower() %>%
        str_extract(fix_street_by_pattern)
    }
    else{
      ulica <- grab_html %>%
        html_nodes(html_identifiers[2]) %>%
        html_text() %>%
        str_to_lower() %>%
        str_extract('.+(?= brno)')
    }
    cena <- grab_html %>%
      html_nodes(html_identifiers[3]) %>%
      html_text() %>%
      str_replace_all(pattern = "\\.|\\s", replacement = "") %>%
      str_extract(pattern = "[0-9]+") %>%
      unlist() %>%
      as.numeric()

    type_dwelling_byt <- grab_html %>%
      html_nodes(html_identifiers[4]) %>%
      html_text() %>%
      str_to_lower() %>%
      str_extract(pattern = coll("byt")) %>%
      as.factor() %>%
      recode("byt" = 1) %>%
      replace_na(replace = 0)


    type_dwelling_pokoj <- grab_html %>%
      html_nodes(html_identifiers[5]) %>%
      html_text() %>%
      str_to_lower() %>%
      str_extract(pattern = coll("pokoj")) %>%
      as.factor() %>%
      recode("pokoj" = 1) %>%
      replace_na(replace = 0)

    type_rooms_kk <- grab_html %>%
      html_nodes(html_identifiers[6]) %>%
      html_text() %>%
      str_to_lower %>%
      str_extract('[1-9]\\+..')




    is_garsoniery <- grab_html %>%
      html_nodes(html_identifiers[7]) %>%
      html_text() %>%
      str_to_lower() %>%
      str_extract(coll("garsoniery"))


    if(square_format_is_wrong==T){
      # check where it should be omit those
      sqr_meters <- grab_html %>%
        html_nodes(html_identifiers[8]) %>%
        html_text() %>%
        str_subset(sqr_format_key) %>%
        str_to_lower() %>%
        str_extract('\\d\\d(?= m)|\\d\\d\\d(?= m)|\\d\\d\\sm|\\d\\d\\sm') %>%
        str_extract('\\d\\d|\\d\\d\\d')
    }



    else{
      sqr_meters <- grab_html %>%
        html_nodes(html_identifiers[8]) %>%
        html_text() %>%
        str_to_lower() %>%
        str_extract('\\d\\d(?= m)|\\d\\d\\d(?= m)')
    }



    if(fix_awful_formatting == T){
      sqr_meters <- sqr_meters %>%
        na.omit(T)
    }

    other_text <- grab_html %>%
      html_nodes(html_identifiers[9]) %>%
      html_text() %>%
      str_to_lower()




    final[[i]] <- matrix( data= NA, ncol = 10, nrow = max(length(miesto),
                                                         length(cena),
                                                         length(type_dwelling_byt),
                                                         length(type_dwelling_pokoj),
                                                         length(sqr_meters),
                                                         length(other_text),
                                                         length(is_garsoniery),
                                                         length(type_rooms_kk),
                                                         length(ulica))) %>%
      as.data.frame()


    if (length(miesto) != 0) {
      final[[i]][1:length(miesto),1] <- miesto

    }
    if (length(ulica)  != 0) {
      final[[i]][1:length(ulica),2] <- ulica
    }
    if (length(cena)  != 0) {
      final[[i]][1:length(cena),3] <- cena

    }
    if (length(type_dwelling_byt)  != 0) {
      final[[i]][1:length(type_dwelling_byt),4] <- type_dwelling_byt

    }
    if (length(type_dwelling_pokoj)  != 0) {
      final[[i]][1:length(type_dwelling_pokoj),5] <- type_dwelling_pokoj

    }
    if (length(type_rooms_kk)  != 0) {
      final[[i]][1:length(type_rooms_kk),6] <- type_rooms_kk

    }
    if (length(is_garsoniery)  != 0) {
      final[[i]][1:length(is_garsoniery),7] <- is_garsoniery

    }
    if (length(sqr_meters)  != 0) {
      final[[i]][1:length(sqr_meters),8] <- sqr_meters

    }
    if (length(other_text)  != 0) {
      final[[i]][1:length(other_text),9] <- other_text

    }

    final[[i]][,10] <- rep(str_c(site,i),length.out=(nrow(final[[i]])))





    colnames(final[[i]]) <- c("Location",
                              "Street",
                              "Price",
                              "Flat",
                              "Room",
                              "Type",
                              "Garsoniery",
                              "Sqr_meters",
                              "Other_Text",
                              "Original_Site")


    Sys.sleep(bottle_neck)

  }
  final <- bind_rows(final)
  return(final)
}

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

# example
# example_html_identifiers <- c("#vypis_table .nem_box .nem_text h2 a",
#                               "#vypis_table .nem_box .nem_text h2 a",
#                               "#vypis_table .nem_box .nem_text .cena",
#                               "#vypis_table .nem_box .nem_text h2",
#                               "#vypis_table .nem_box .nem_text h2",
#                               "#vypis_table .nem_box .nem_text",
#                               "#vypis_table .nem_box .nem_text",
#                               "#vypis_table .nem_box .nem_text .td_info .info_icons",
#                               "#vypis_table .nem_box .nem_text")

# example usage of the function, specifying the site, the html elements and finally,
# the number of pages across which this is spread
# test <- brno_houseprice_tool(site = "https://www.reality-brno.net/pronajem/byty/?strana=",
#                              html_identifier = example_html_identifiers,
#                              num_of_pages = 13,
#                              bottle_neck = 1)
