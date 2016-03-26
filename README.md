# A collection of RStudio addins
[![Build Status](https://travis-ci.org/csgillespie/raddins.png?branch=master)](https://travis-ci.org/csgillespie/raddins) 
[![CRAN](http://www.r-pkg.org/badges/version/raddins)](http://cran.rstudio.com/package=raddins)

RStudio addins let you execute a bit of R code or a Shiny app through the RStudio IDE,
either via the Addins dropdown menu or with a keyboard shortcut. 

This package contains a collection of RStudio
[addins](https://rstudio.github.io/rstudioaddins/). To run these addins, you need the
latest version of [RStudio](https://www.rstudio.com/). 

This package can be installed via
```
devtools::install_github("csgillespie/raddins")
```

## Running addins

After installing the package, the _Addins_ menu toolbar will be populated with the 
new, exported addins

![alt text](https://raw.github.com/csgillespie/raddins/master/images/screenshot.png)


## Addins

This package currently has four addins:

### `comment_block`

Changes text from

```
Some text
```

to
```
###################################################
## Some text                                     ##
###################################################
```

## `fix_width`

Formats text to have a maximum width of `options(width)`

## `move_up`

Moves a line of text up one row and appends it to the line above.

## `rstudio_section`

Makes an rstudio section block by adding `#` to the start of the line and 
appending `----` to the end.

## Other addins

  * Jenny Bryan's assign default [arguments](https://github.com/jennybc/jadd)
  * [WrapRmd](https://github.com/tjmahr/WrapRmd) which wraps R Markdown 
  text without mangling inline R code

## Other information

 * If you have any suggestions or find bugs, please use the github issue tracker.
 * Feel free to submit pull requests for new addins.
