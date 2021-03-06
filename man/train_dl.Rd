% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/train_dl.r
\name{train_dl}
\alias{train_dl}
\title{Train deep learning SDM}
\usage{
train_dl(input_data)
}
\arguments{
\item{input_data}{A dataframe containing parsed and processed deep learning data.}
}
\value{
A list containing the trained deep learning model object and a history object for performance evaluation.
}
\description{
Train deep learning SDM
}
\examples{
\dontrun{
# download benchmarking data
benchmarking_data <- get_benchmarking_data("Lynx lynx",
                                           limit = 1500)

# transform benchmarking data into a format suitable for deep learning
# if you have previously used a partitioning method you should specify it here
benchmarking_data_dl <- prepare_dl_data(input_data = benchmarking_data$df_data,
                                       partitioning_type = "default")

# perform sanity check on the transformed dataset
# for the training set
head(benchmarking_data_dl$train_tbl)
table(benchmarking_data_dl$y_train_vec)

# for the test set
head(benchmarking_data_dl$test_tbl)
table(benchmarking_data_dl$y_test_vec)

# train neural network
keras_results <- train_dl(benchmarking_data_dl)

# inspect results
keras_results$history

# you can also plot them
plot(keras_results$history)
}
}
