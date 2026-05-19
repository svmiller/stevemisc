# Legacy functions for Steve's Preferred ggplot2 Themes and Assorted Stuff

`theme_steve()`, now in stevethemes, was a preferred theme of mine a few
years ago. It was basically `theme_bw()` from ggplot2 theme, but with me
tweaking a few things. I then moved to `theme_steve_web()` for most
things now, prominently on my website. This theme incorporates the "Open
Sans" and "Titillium Web" fonts that I like so much. `post_bg()` is a
legacy function for changing the backgrounds on plots to better match
what was the background color on my website. `theme_steve_ms()` is for
`LaTeX` manuscripts that use the `cochineal` font package.
`theme_steve_font()` is for any purpose, allowing you to supply your own
font.

## Usage

``` r
theme_steve_web(...)

post_bg(...)

theme_steve_ms(axis_face = "italic", caption_face = "italic", ...)

theme_steve_font(axis_face = "italic", caption_face = "italic", font, ...)
```

## Arguments

- ...:

  optional stuff, but don't put anything in here. You won't need it.

- axis_face:

  font face ("plain", "italic", "bold", "bold.italic"). Optional,
  defaults to "italic". Applicable only to `theme_steve_ms()`.

- caption_face:

  font face ("plain", "italic", "bold", "bold.italic"). Optional,
  defaults to "italic". Applicable only to `theme_steve_ms()`.

- font:

  font family for the plot. Applicable only to `theme_steve_font()`.

## Value

`post_bg()` takes a ggplot2 plot and changes the background to have a
color of "#fdfdfd". `theme_steve_web()` extends `theme_steve()` to add
custom fonts, notably "Open Sans" and "Titillium Web". In all cases,
these functions take a ggplot2 plot and return another ggplot2 plot, but
with some cosmetic changes. `theme_steve_ms()` takes a ggplot2 plot and
overlays "Crimson Pro" fonts, which is the basis of the `cochineal` font
package in `LaTeX`. `theme_steve_font()` takes a ggplot2 plot and
overlays a font of your choosing.

## Details

`theme_steve_web()` and `theme_steve_ms()` both explicitly depend on
having the fonts installed on your end. It's ultimately optional for you
to have them but the use of these functions imply them. All functions
that remain here should be understood as "legacy" functions that will no
longer be maintained or updated. The stevethemes package will have all
my ggplot2 elements going forward.

## See also

[ggplot2::theme](https://ggplot2.tidyverse.org/reference/theme.html)

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)


ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() + theme_steve_web() +
  labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
  subtitle = "Notice the prettier fonts, if you have them.",
  caption = "Data: ?mtcars in {datasets} in base R.")

ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() + theme_steve_web() +
  post_bg() +
  labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
  subtitle = "Notice the slight change in background color",
  caption = "Data: ?mtcars in {datasets} in base R.")

ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() + theme_steve_ms() +
  labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
  subtitle = "Notice the fonts will match the 'cochineal' font package in LaTeX.",
  caption = "Data: ?mtcars in {datasets} in base R.")

ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() + theme_steve_font(font = "Comic Sans MS") +
  labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
  subtitle = "Notice that this will look ridiculous",
  caption = "Data: ?mtcars in {datasets} in base R.")
} # }
```
