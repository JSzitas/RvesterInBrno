# site and html element placeholder script


site_link_1 <- c("https://www.reality-brno.net/pronajem/byty/4?strana=")
site_link_2 <- c("https://reality.idnes.cz/s/pronajem/byty/brno-mesto/?page=")
site_link_2_a <- c("https://reality.idnes.cz/s/pronajem/byty/brno-mesto/")
site_link_3 <- c("https://www.bezrealitky.cz/vypis/nabidka-pronajem/byt/jihomoravsky-kraj/okres-brno-mesto?_token=Iub34XwT4_as-NzBzzr04q-DZE6Ym9vRCFRzqcD-xpI&page=")
site_link_4 <- c("https://www.studentreality.cz/s/Brno?page=")
site_chaser_4 <- c("&filterStatistics%5Blocality%5D=Brno&filterStatistics%5Badministrative_area_level_2%5D=Brno-City+District&filterStatistics%5Badministrative_area_level_1%5D=South+Moravian+Region&filterStatistics%5Bcountry%5D=CZ&latLng=49.141185%2C16.51311%2C49.248876%2C16.700564&zoom=10")
site_link_5 <- c("https://www.flatio.cz/bydleni-k-pronajmu-Brno?page=")
site_chaser_5 <- c("&latLng=49.096102%2C16.469529%2C49.293313%2C16.741408&zoom=12")
site_link_6 <- c("https://www.ulovdomov.cz/#!/vyhledavani/pronajem/Brno/v-49.24898;16.72016;49.08489;16.44447")

html_objects_1 <- c("#vypis_table .nem_box .nem_text h2 a",
                    "#vypis_table .nem_box .nem_text h2 a",
                    "#vypis_table .nem_box .nem_text .cena",
                    "#vypis_table .nem_box .nem_text h2",
                    "#vypis_table .nem_box .nem_text h2",
                    "#vypis_table .nem_box .nem_text",
                    "#vypis_table .nem_box .nem_text",
                    "#vypis_table .nem_box .nem_text .td_info .info_icons",
                    "#vypis_table .nem_box .nem_text")

html_objects_2 <- c("article div div a p:nth-child(2)",
                    "article div div a p:nth-child(2)",
                    "article div div a p strong",
                    "article div div a h2:nth-child(1)",
                    "article div div a h2:nth-child(1)",
                    "article div div a h2",
                    "article div div a h2",
                    "article div div a h2",
                    "article div div a h2",
                    "article div div")

html_objects_3 <- c("div div div article div h3 a strong",
                    "div div div article div h3 a strong",
                    "div div div article div p span span strong",
                    "div div div article div p:nth-child(2)",
                    "div div div article div p:nth-child(2)",
                    "div div div article div p:nth-child(2)",
                    "div div div article div div div p:nth-child(1)",
                    "div div div article div p:nth-child(2)",
                    "div div div article div p:nth-child(2)",
                    "div div div article div div div p:nth-child(1)")
html_objects_4 <- c("div.offer div:nth-child(3) div:nth-child(2) a:nth-child(1)",
                    "div.offer div:nth-child(3) h2:nth-child(1) a:nth-child(1)",
                    "div.offer div .price",
                    "div.offer div:nth-child(3) h2:nth-child(1) a:nth-child(1)",
                    "div.offer div:nth-child(3) h2:nth-child(1) a:nth-child(1)",
                    "div.offer div:nth-child(3) h2:nth-child(1) a:nth-child(1)",
                    "div.offer div:nth-child(3) h2:nth-child(1) a:nth-child(1)",
                    "div.offer div div ul li:nth-child(1)",
                    "div.offer div:nth-child(3) div:nth-child(3) ul:nth-child(1) li:nth-child(1)")

html_objects_5 <- c("div.col-xs-12 a:nth-child(2) div:nth-child(1) h2:nth-child(1)",
                    "div.col-xs-12 a:nth-child(2) div:nth-child(1) h2:nth-child(1)",
                    "div div .price",
                    "div.col-xs-12 a:nth-child(2) div:nth-child(1) h2:nth-child(1)",
                    "div.col-xs-12 a:nth-child(2) div:nth-child(1) h2:nth-child(1)",
                    "div.col-xs-12 a:nth-child(2) div:nth-child(1) h2:nth-child(1)",
                    "div.col-xs-12 a:nth-child(2) div:nth-child(1) h2:nth-child(1)",
                    "div.col-xs-12 a:nth-child(2) div:nth-child(2) span:nth-child(1)",
                    "div.col-xs-12 a:nth-child(2) div:nth-child(2)")


