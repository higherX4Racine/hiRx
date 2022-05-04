# Copyright (C) 2022 by Higher Expectations for Racine County

BLS_DOMAIN <- "https://download.bls.gov"

# URLS for data from the Local Area Unemployment Statistics database.

LAUS_ROOT_PATH <- "pub/time.series/la"

LAUS_URL <- file.path(BLS_DOMAIN,
                      LAUS_ROOT_PATH,
                      fsep = "/")
