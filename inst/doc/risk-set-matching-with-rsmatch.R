## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(rsmatch)

## ----data---------------------------------------------------------------------
data(oasis)
head(oasis, n = 10)

## ----example1-----------------------------------------------------------------
pairs <- brsmatch(
  n_pairs = 5,
  data = oasis,
  id = "subject_id", 
  time = "visit", 
  trt_time = "time_of_ad",
  covariates = c("m_f", "educ", "ses", "age", 
                 "mr_delay", "e_tiv", "n_wbv", "asf"),
  balance = TRUE, 
  balance_covariates = c("m_f", "age")
)

na.omit(pairs)

## -----------------------------------------------------------------------------
first_pair <- pairs[which(pairs$pair_id == 1), "subject_id"]
oasis[which(oasis$subject_id %in% first_pair), ]

## ---- warning=FALSE, message=FALSE--------------------------------------------
pairs <- coxpsmatch(
  n_pairs = 5,
  data = oasis,
  id = "subject_id", 
  time = "visit", 
  trt_time = "time_of_ad",
  covariates = c("m_f", "educ", "ses", "age", 
                 "mr_delay", "e_tiv", "n_wbv", "asf")
)

na.omit(pairs)

## ---- warning=FALSE, message=FALSE--------------------------------------------
second_pair <- pairs[which(pairs$pair_id == 2), "subject_id"]
oasis[which(oasis$subject_id %in% second_pair), ]

