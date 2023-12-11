
# El siguiente origen de datos es Open Data o Big Data. Un punto ----------

# Open data

# Obtenga los datos de forma remota y léalos en el estudio ----------------

install.packages("tidyverse")

install.packages("janitor")

library(tidyverse)

library(dplyr)

library(jsonlite)

library(janitor)


ds <- fromJSON ("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")

ds %>% View()

ds_chicha <- ds$ListaEESSPrecio 

ds_chicha %>% glimpse()

# EDA ---------------------------------------------------------------------

# Los datos contienen espacios, comas, simbolos y caracteres extraños , además de que estan en formato incorrecto por ejemplo 
# los numericos deberían ser int o real y no char. Por lo que se procede a limpiar los datos.

ds_cleaned <- ds_chicha %>% clean_names() %>% as_tibble() %>% glimpse()

locale <- locale(decimal_mark = ",")

ds_cleaned_num <- type.convert(ds_cleaned, locale = locale(decimal_mark = ",")) %>% glimpse()


