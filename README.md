
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fars

<!-- badges: start -->

[![Build
Status](https://app.travis-ci.com/ztimpe/fars.svg?branch=master)](https://app.travis-ci.com/ztimpe/fars)
<!-- badges: end -->

The goal of fars is to …

## Installation

You can install the released version of fars from
[CRAN](https://CRAN.R-project.org) with:

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ztimpe/fars")
#> WARNING: Rtools is required to build R packages, but is not currently installed.
#> 
#> Please download and install Rtools 4.0 from https://cran.r-project.org/bin/windows/Rtools/.
#> Downloading GitHub repo ztimpe/fars@HEAD
#> cpp11     (0.3.1  -> 0.4.0 ) [CRAN]
#> utf8      (1.2.1  -> 1.2.2 ) [CRAN]
#> pillar    (1.6.2  -> 1.6.3 ) [CRAN]
#> tibble    (3.1.2  -> 3.1.5 ) [CRAN]
#> rlang     (0.4.10 -> 0.4.11) [CRAN]
#> lifecycle (1.0.0  -> 1.0.1 ) [CRAN]
#> hms       (1.1.0  -> 1.1.1 ) [CRAN]
#> vroom     (1.5.3  -> 1.5.5 ) [CRAN]
#> maps      (3.3.0  -> 3.4.0 ) [CRAN]
#> readr     (1.4.0  -> 2.0.2 ) [CRAN]
#> tidyr     (1.1.3  -> 1.1.4 ) [CRAN]
#> Installing 11 packages: cpp11, utf8, pillar, tibble, rlang, lifecycle, hms, vroom, maps, readr, tidyr
#> Installing packages into 'C:/Users/53643/Documents/R/win-library/4.0'
#> (as 'lib' is unspecified)
#> package 'cpp11' successfully unpacked and MD5 sums checked
#> package 'utf8' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'utf8'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying C:
#> \Users\53643\Documents\R\win-library\4.0\00LOCK\utf8\libs\x64\utf8.dll to C:
#> \Users\53643\Documents\R\win-library\4.0\utf8\libs\x64\utf8.dll: Permission
#> denied
#> Warning: restored 'utf8'
#> package 'pillar' successfully unpacked and MD5 sums checked
#> package 'tibble' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'tibble'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying C:
#> \Users\53643\Documents\R\win-library\4.0\00LOCK\tibble\libs\x64\tibble.dll to C:
#> \Users\53643\Documents\R\win-library\4.0\tibble\libs\x64\tibble.dll: Permission
#> denied
#> Warning: restored 'tibble'
#> package 'rlang' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'rlang'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying C:
#> \Users\53643\Documents\R\win-library\4.0\00LOCK\rlang\libs\x64\rlang.dll to C:
#> \Users\53643\Documents\R\win-library\4.0\rlang\libs\x64\rlang.dll: Permission
#> denied
#> Warning: restored 'rlang'
#> package 'lifecycle' successfully unpacked and MD5 sums checked
#> package 'hms' successfully unpacked and MD5 sums checked
#> package 'vroom' successfully unpacked and MD5 sums checked
#> package 'maps' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'maps'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying C:
#> \Users\53643\Documents\R\win-library\4.0\00LOCK\maps\libs\x64\maps.dll to C:
#> \Users\53643\Documents\R\win-library\4.0\maps\libs\x64\maps.dll: Permission
#> denied
#> Warning: restored 'maps'
#> package 'readr' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'readr'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying C:
#> \Users\53643\Documents\R\win-library\4.0\00LOCK\readr\libs\x64\readr.dll to C:
#> \Users\53643\Documents\R\win-library\4.0\readr\libs\x64\readr.dll: Permission
#> denied
#> Warning: restored 'readr'
#> package 'tidyr' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'tidyr'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying C:
#> \Users\53643\Documents\R\win-library\4.0\00LOCK\tidyr\libs\x64\tidyr.dll to C:
#> \Users\53643\Documents\R\win-library\4.0\tidyr\libs\x64\tidyr.dll: Permission
#> denied
#> Warning: restored 'tidyr'
#> 
#> The downloaded binary packages are in
#>  C:\Users\53643\AppData\Local\Temp\RtmpoLnMEU\downloaded_packages
#> WARNING: Rtools is required to build R packages, but is not currently installed.
#> 
#> Please download and install Rtools 4.0 from https://cran.r-project.org/bin/windows/Rtools/.
#>          checking for file 'C:\Users\53643\AppData\Local\Temp\RtmpoLnMEU\remotes5028cc51777\ztimpe-fars-7d37761/DESCRIPTION' ...  v  checking for file 'C:\Users\53643\AppData\Local\Temp\RtmpoLnMEU\remotes5028cc51777\ztimpe-fars-7d37761/DESCRIPTION' (1.2s)
#>       -  preparing 'fars': (601ms)
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
#>       -  checking for LF line-endings in source and make files and shell scripts
#>       -  checking for empty or unneeded directories
#>       -  building 'fars_0.0.0.9000.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/53643/Documents/R/win-library/4.0'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(fars)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
