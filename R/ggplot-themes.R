#' @title Steve's Preferred \pkg{ggplot2} Themes and Assorted Stuff
#'
#' @description \code{theme_steve()} was a preferred theme of mine a few years ago. It is
#' basically \code{theme_bw()} from \pkg{ggplot2} theme, but with me
#' tweaking a few things. I've since moved to \code{theme_steve_web()} for most things
#' now, prominently on my website. It incorporates the "Open Sans" and "Titillium Web"
#' fonts that I like so much. \code{post_bg()} is for changing the backgrounds on
#' plots to better match my website for posts that I write. \code{theme_steve_ms()} is
#' for \code{LaTeX} manuscripts that use the \code{cochineal} font package. \code{theme_steve_font()} is
#' for any purpose, allowing you to supply your own font.
#'
#' @details \code{theme_steve_web()} depends on having the fonts installed on your end.
#' It's ultimately optional for you to have them.
#'
#' @return \code{post_bg()} takes a \pkg{ggplot2} plot and changes the background to have a color of
#' "#fdfdfd". \code{theme_steve()} takes a \pkg{ggplot2} plot and formats it to approximate
#' \code{theme_bw()} from \pkg{ggplot2}, but with some other tweaks. \code{theme_steve_web()} extends
#' \code{theme_steve()} to add custom fonts, notably "Open Sans" and "Titillium Web". In all cases, these
#' functions take a \pkg{ggplot2} plot and return another \pkg{ggplot2} plot, but with some cosmetic
#' changes. \code{theme_steve_ms()} takes a \pkg{ggplot2} plot and overlays "Crimson Text" fonts, which is
#' the basis of the \code{cochineal} font package in \code{LaTeX}. \code{theme_steve_font()} takes a \pkg{ggplot2} plot and
#' overlays a font of your choosing.
#'
#' @param ... optional stuff, but don't put anything in here. You won't need it.
#' @param axis_face font face ("plain", "italic", "bold", "bold.italic"). Optional, defaults to "italic". Applicable only to \code{theme_steve_ms()}.
#' @param caption_face font face ("plain", "italic", "bold", "bold.italic"). Optional, defaults to "italic". Applicable only to \code{theme_steve_ms()}.
#' @param font font family for the plot. Applicable only to \code{theme_steve_font()}.

#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve() +
#'   labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
#'   subtitle = "We've all seen this plot over a hundred times.",
#'   caption = "Data: ?mtcars in {datasets} in base R.")
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve_web() +
#'   labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
#'   subtitle = "Notice the prettier fonts, if you have them.",
#'   caption = "Data: ?mtcars in {datasets} in base R.")
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve_web() +
#'   post_bg() +
#'   labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
#'   subtitle = "Notice the slight change in background color",
#'   caption = "Data: ?mtcars in {datasets} in base R.")
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve_ms() +
#'   labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
#'   subtitle = "Notice the fonts will match the 'cochineal' font package in LaTeX.",
#'   caption = "Data: ?mtcars in {datasets} in base R.")
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve_font(font = "Comic Sans MS") +
#'   labs(title = "A ggplot2 Plot from the Motor Trend Car Road Tests Data",
#'   subtitle = "Notice the fonts will match the 'cochineal' font package in LaTeX.",
#'   caption = "Data: ?mtcars in {datasets} in base R.")
#' }
#' @rdname ggplot-themes
#' @seealso [ggplot2::theme]
#' @export

theme_steve <- function(...) {
  theme_bw() + theme(panel.border = element_blank(),
                     plot.margin = margin(15, 15, 15, 15),
                     plot.caption = element_text(hjust = 1,
                                                 size = 9,
                                                 margin = margin(t = 10),
                                                 face = "italic"),
                     plot.title = element_text(hjust = 0, size = 18,
                                               margin = margin(b = 10), face = "bold"),
                     axis.title.y = element_text(size = 12, hjust = 1, face = "italic"),
                     axis.title.x = element_text(hjust = 1, size = 12, face = "italic"),
                     legend.position = "bottom",
                     legend.title = element_text(face = "bold")) +
    theme(legend.spacing.x = unit(0.1, "cm"))

}

#' @rdname ggplot-themes
#' @export

theme_steve_web <- function(...) {
  #require(ggplot2)
  get_os <- function() {
    sysinf <- Sys.info()
    if (!is.null(sysinf)) {
      os <- sysinf["sysname"]
      if (os == "Darwin")
        os <- "osx"
    } else { ## mystery machine
      os <- .Platform$OS.type
      if (grepl("^darwin", R.version$os))
        os <- "osx"
      if (grepl("linux-gnu", R.version$os))
        os <- "linux"
    }
    tolower(os)
  }
  if (get_os() == "osx") {
    theme_bw() +
      theme(panel.border = element_blank(),
            plot.margin = ggplot2::margin(15, 15, 15, 15),
            plot.caption = element_text(hjust = 1, size = 9,
                                        margin = ggplot2::margin(t = 10),
                                        face = "italic"),
            plot.title = element_text(hjust = 0, size = 18,
                                      margin = ggplot2::margin(b = 10),
                                      face = "bold", family = "Titillium Web"),
            plot.subtitle = element_text(hjust = 0,
                                         margin = ggplot2::margin(b = 10),
                                         family = "Open Sans"),
            axis.title.y = element_text(size = 10, hjust = 1,
                                        face = "italic", family = "Open Sans"),
            axis.title.x = element_text(hjust = 1, size = 10, face = "italic",
                                        family = "Open Sans",
                                        margin = ggplot2::margin(t = 10)),
            legend.position = "bottom",
            legend.title = element_text(face = "bold",
                                        family = "Titillium Web"),
            text = element_text(family = "Open Sans")) +
      theme(legend.spacing.x = unit(.1, "cm"),
            panel.spacing = grid::unit(1.5, "lines"))
  }
  else {
    theme_bw() +
      theme(panel.border = element_blank(),
            plot.margin = ggplot2::margin(15, 15, 15, 15),
            plot.caption = element_text(hjust = 1, size = 9,
                                        margin = ggplot2::margin(t = 10),
                                        face = "italic"),
            plot.title = element_text(hjust = 0, size = 18,
                                      margin = ggplot2::margin(b = 10),
                                      face = "bold", family = "Titillium Web"),
            plot.subtitle = element_text(hjust = 0,
                                         margin = ggplot2::margin(b = 10),
                                         family = "Open Sans"),
            axis.title.y = element_text(size = 10, hjust = 1,
                                        face = "italic", family = "Open Sans"),
            axis.title.x = element_text(hjust = 1, size = 10, face = "italic",
                                        family = "Open Sans",
                                        margin = ggplot2::margin(t = 10)),
            legend.position = "bottom",
            legend.title = element_text(face = "bold",
                                        family = "Titillium Web"),
            text = element_text(family = "Open Sans")) +
      theme(legend.spacing.x = unit(.1, "cm"),
            panel.spacing = grid::unit(1.5, "lines"))
  }
}

# theme_steve_web2 <- function() {
#   require(ggplot2)
#   theme_steve_web() +
#   theme(legend.title = element_text(family = "Titillium WebBold"),
#         plot.title = element_text(family = "Titillium WebBold"))
# }

#' @rdname ggplot-themes
#' @export

post_bg <- function(...) {
  #require(ggplot2)
  theme(plot.background = element_rect(fill = "#fdfdfd"),
        panel.background = element_rect(fill = "#fdfdfd"),
        legend.key = element_rect(fill = "#fdfdfd"),
        legend.background = element_rect(fill = "#fdfdfd"))
}

#' @rdname ggplot-themes
#' @export

theme_steve_ms <- function(axis_face = "italic", caption_face = "italic", ...) {
  #require(ggplot2)
  get_os <- function() {
    sysinf <- Sys.info()
    if (!is.null(sysinf)) {
      os <- sysinf["sysname"]
      if (os == "Darwin")
        os <- "osx"
    } else { ## mystery machine
      os <- .Platform$OS.type
      if (grepl("^darwin", R.version$os))
        os <- "osx"
      if (grepl("linux-gnu", R.version$os))
        os <- "linux"
    }
    tolower(os)
  }
  if (get_os() == "osx") {
    theme_bw() +
      theme(panel.border = element_blank(),
            plot.margin = ggplot2::margin(20, 20, 20, 20),
            plot.caption = element_text(hjust = 1, size = 9,
                                        margin = ggplot2::margin(t = 10),
                                        face = caption_face),
            plot.title = element_text(hjust = 0, size = 18,
                                      margin = ggplot2::margin(b = 10),
                                      face = "bold", family = "Crimson Text"),
            plot.subtitle = element_text(hjust = 0,
                                         margin = ggplot2::margin(b = 10),
                                         family = "Crimson Text"),
            axis.title.y = element_text(size = 10, hjust = 1,
                                        face = axis_face, family = "Crimson Text"),
            axis.title.x = element_text(hjust = 1, size = 10, face = axis_face,
                                        family = "Crimson Text",
                                        margin = ggplot2::margin(t = 10)),
            legend.position = "bottom",
            legend.title = element_text(face = "bold",
                                        family = "Crimson Text"),
            text = element_text(family = "Crimson Text")) +
      theme(legend.spacing.x = unit(.1, "cm"),
            panel.spacing = grid::unit(1.5, "lines"))
  }
  else {
    theme_bw() +
      theme(panel.border = element_blank(),
            plot.margin = ggplot2::margin(20, 20, 20, 20),
            plot.caption = element_text(hjust = 1, size = 9,
                                        margin = ggplot2::margin(t = 10),
                                        face = caption_face),
            plot.title = element_text(hjust = 0, size = 18,
                                      margin = ggplot2::margin(b = 10),
                                      face = "bold", family = "Crimson Text"),
            plot.subtitle = element_text(hjust = 0,
                                         margin = ggplot2::margin(b = 10),
                                         family = "Crimson Text"),
            axis.title.y = element_text(size = 10, hjust = 1,
                                        face = axis_face, family = "Crimson Text"),
            axis.title.x = element_text(hjust = 1, size = 10, face = axis_face,
                                        family = "Crimson Text",
                                        margin = ggplot2::margin(t = 10)),
            legend.position = "bottom",
            legend.title = element_text(face = "bold",
                                        family = "Crimson Text"),
            text = element_text(family = "Crimson Text")) +
      theme(legend.spacing.x = unit(.1, "cm"),
            panel.spacing = grid::unit(1.5, "lines"))
  }
}


#' @rdname ggplot-themes
#' @export

theme_steve_font <- function(axis_face = "italic", caption_face = "italic", font, ...) {
  #require(ggplot2)
  get_os <- function() {
    sysinf <- Sys.info()
    if (!is.null(sysinf)) {
      os <- sysinf["sysname"]
      if (os == "Darwin")
        os <- "osx"
    } else { ## mystery machine
      os <- .Platform$OS.type
      if (grepl("^darwin", R.version$os))
        os <- "osx"
      if (grepl("linux-gnu", R.version$os))
        os <- "linux"
    }
    tolower(os)
  }
  if (get_os() == "osx") {
    theme_bw() +
      theme(panel.border = element_blank(),
            plot.margin = ggplot2::margin(20, 20, 20, 20),
            plot.caption = element_text(hjust = 1, size = 9,
                                        margin = ggplot2::margin(t = 10),
                                        face = caption_face),
            plot.title = element_text(hjust = 0, size = 18,
                                      margin = ggplot2::margin(b = 10),
                                      face = "bold", family = font),
            plot.subtitle = element_text(hjust = 0,
                                         margin = ggplot2::margin(b = 10),
                                         family = font),
            axis.title.y = element_text(size = 10, hjust = 1,
                                        face = axis_face, family = font),
            axis.title.x = element_text(hjust = 1, size = 10, face = axis_face,
                                        family = font,
                                        margin = ggplot2::margin(t = 10)),
            legend.position = "bottom",
            legend.title = element_text(face = "bold",
                                        family = font),
            text = element_text(family = font)) +
      theme(legend.spacing.x = unit(.1, "cm"),
            panel.spacing = grid::unit(1.5, "lines"))
  }
  else {
    theme_bw() +
      theme(panel.border = element_blank(),
            plot.margin = ggplot2::margin(20, 20, 20, 20),
            plot.caption = element_text(hjust = 1, size = 9,
                                        margin = ggplot2::margin(t = 10),
                                        face = caption_face),
            plot.title = element_text(hjust = 0, size = 18,
                                      margin = ggplot2::margin(b = 10),
                                      face = "bold", family = font),
            plot.subtitle = element_text(hjust = 0,
                                         margin = ggplot2::margin(b = 10),
                                         family = font),
            axis.title.y = element_text(size = 10, hjust = 1,
                                        face = axis_face, family = font),
            axis.title.x = element_text(hjust = 1, size = 10, face = axis_face,
                                        family = font,
                                        margin = ggplot2::margin(t = 10)),
            legend.position = "bottom",
            legend.title = element_text(face = "bold",
                                        family = font),
            text = element_text(family = font)) +
      theme(legend.spacing.x = unit(.1, "cm"),
            panel.spacing = grid::unit(1.5, "lines"))
  }
}
