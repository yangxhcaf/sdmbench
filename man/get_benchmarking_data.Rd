% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_benchmarking_data.r
\name{get_benchmarking_data}
\alias{get_benchmarking_data}
\title{Download data for benchmarking}
\usage{
get_benchmarking_data(scientific_name, limit = 1000,
  climate_type = "default", climate_resolution = 10,
  projected_model = "BC", rcp = 45, year = 50)
}
\arguments{
\item{scientific_name}{A character string indicating scientific species name.}

\item{limit}{A numeric value indicating maximum number of occurrence records requested. The value has to be positive and has a maximum of 200000 (observations you can download with a single call).}

\item{climate_type}{A character string indicating type of climate variables, either `default` for current climate or `future` for CMIP5 projections.}

\item{climate_resolution}{A numeric value indicating the resolution of the raster environmental variables. For a climate type of `default` possible resolutions are: 0.5, 2.5, 5, and 10 (minutes of a degree). For a `future` climate: 2.5, 5, and 10.}

\item{projected_model}{A character string indicates the type of future climate projection. Possible values are: "AC", "BC", "CC", "CE", "CN", "GF", "GD", "GS", "HD", "HG", "HE", "IN", "IP", "MI", "MR", "MC", "MP", "MG", or "NO".}

\item{rcp}{A numeric value indicating representative concentration pathways. Possible values: 26, 45, 60, or 85.}

\item{year}{A numeric value indicating the number of years into the future for projection. Can be 50 or 70.}
}
\value{
A list containing the downloaded datasets.
}
\description{
Download data for benchmarking
}
\examples{
\dontrun{
# get data using the default parameters (the only required one is the species name)
result_data <- get_benchmarking_data("Lynx lynx")

# get a custom number of observations at a higher climate resolution
# note that downloading higher resolution data takes longer
result_data <- get_benchmarking_data("Lynx lynx",
                                     limit = 1500,
                                     climate_resolution = 5)

# get environmental data for a future climate projection (CMIP5)
result_data <- get_benchmarking_data("Lynx lynx",
                                     limit = 1500,
                                     climate_resolution = 5,
                                     climate_type = "future")

# specify projection model
# the default is BC (Beijing Climate Center Climate System Model)
# note that not all combinations of climate values are possible
result_data <- get_benchmarking_data("Lynx lynx",
                                     limit = 1500,
                                     climate_resolution = 10,
                                     climate_type = "future",
                                     projected_model = "AC")

# specify number of years into the future
# if you are interested in the longer term effects of climate change
result_data <- get_benchmarking_data("Lynx lynx",
                                     limit = 1500,
                                     climate_resolution = 5,
                                     climate_type = "future",
                                     year = 70)

# specify RCP (representative concentration pathway)
# this value represents one of four greenhouse gas concentration trajectories
result_data <- get_benchmarking_data("Lynx lynx",
                                     limit = 1500,
                                     climate_resolution = 5,
                                     climate_type = "future",
                                     year = 70,
                                     rcp = 26)

# after obtaining the data you can inspect its different components
# raw data
head(result_data$df_data)

# check class balance (presence / absence)
table(result_data$df_data$label)

# the result object also contains the data in raster format
result_data$raster_data
}
}
