#' This collection of functions is used for the US National
#' Highway Traffic Safety Administration's Fatality Analysis Reporting System,
#' which is a nationwide census providing the American public yearly data
#' regarding fatal injuries suffered in motor vehicle traffic crashes.
#' @importFrom tidyr spread
#' @importFrom maps map
#' @importFrom magrittr %>%
#' @importFrom dplyr tbl_df
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr filter
#' @importFrom dplyr summarize
#' @importFrom dplyr group_by
#' @importFrom dplyr bind_rows
#' @importFrom readr read_csv
#'
#'
#'
#' @title fars_read
#'
#' @description This function checks for the existence of the file in folder, and if the file
#' does not exist, stops to let the user know that file does not exist. Otherwise,
#' the file is read in and converted to a data table.
#'
#' @param filename The name of the file to read into R.
#' @return fars_read returns a tibble or lets user know if file doesn't exist.
#'
#' @export

fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}
#'
#' @title make_filename
#' @description This function takes year as an argument, converts to integer, and returns a filename
#' with that can be read as "accident_",year,".csv.bz2")
#'
#' @param year Year of data to be read.
#' @return make_filename returns string filename of data set to import.

#' @export

make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}
#'
#' @title fars_read_years
#' @description This function iterates over a list of years provided by user, first making a filename to
#' read from the folder, trying to read the file and if successful, creating a year variable
#' equal to the element, and finishing by selecting the month and year. If unable to read
#' file, throws back an error.

#' @note Error is returned if file is not valid name, which is due to invalid year.
#'
#' @param years A list of years for filenames to be read into R.
#' @return fars_read_years returns a list of tibbles with year and month as columns

#' @export

fars_read_years <- function(years) {
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = year) %>%
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}
#'
#'
#' @title fars_summarize_years
#' @description This function takes an argument that is a year, reads the data in if it exists,
#' keeping month and year, and giving the number of observations grouped by month and year.
#'
#' @param years A list of years that were read into R for summarization.
#' @return fars_summarize_years returns a tibble of number of accidents for each year with month as column

#' @export

fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>%
                dplyr::group_by(year, MONTH) %>%
                dplyr::summarize(n = n()) %>%
                tidyr::spread(year, n)
}
#'
#' @title fars_map_state
#' @description This function expands on the previous functions by now including a state.num argument. The
#' Here, the data are read in, and then checked for the presence of the state, given by state.num.
#' If the state is not in the data, the function stops. If state is present, data are filtered to
#' this state only and checked for number of accidents that occurred. If none, message is printed,
#' but if there is data, then the locations by latitude and longitude are plotted.
#'
#' @param state.num A number identifier for state of interest
#' @param year A year of data to graph locations of accidents.
#' @return fars_map_state returns a plot object.
#' @note returns an error if state number is invalid.
#' @export

fars_map_state <- function(state.num, year) {
        filename <- make_filename(year)
        data <- fars_read(filename)
        state.num <- as.integer(state.num)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter(data, STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                graphics::points(LONGITUD, LATITUDE, pch = 46)
        })
}
#'
#' @examples
#' \dontrun{fars_read(filename = "accident_2018.csv.bz2")}
#' \dontrun{make_filename(year = "1987")}
#' \dontrun{fars_read_years(years = c(1987,1988,1989))}
#' \dontrun{fars_summarize_years(years = c(1987,1988,1989))}
#' \dontrun{fars_map_state(state.num = 1,year = 1987)}
