#' @title Steve's Preferred \pkg{ggplot2} Themes and Assorted Stuff
#'
#' @description \code{theme_steve()} was a preferred theme of mine a few years ago. It is
#' basically \code{theme_bw()} from \pkg{ggplot2} theme, but with me
#' tweaking a few things. I've since moved to \code{theme_steve_web()} for most things
#' now, prominently on my website. It incorporates the "Open Sans" and "Titillium Web"
#' fonts that I like so much. \code{post_bg()} is for changing the backgrounds on
#' plots to better match my website for posts that I write.
#'
#' @details \code{theme_steve_web()} epends on having the fonts installed on your end.
#' It's ultimately optional for you to have them.
#'
#' @param ... optional stuff, but don't put anything in here. You won't need it.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve()
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve_web()
#'
#' ggplot(mtcars, aes(x = mpg, y = hp)) +
#'   geom_point() + theme_steve_web() +
#'   post_bg()
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
