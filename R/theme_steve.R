theme_steve <- function() {
  theme_bw() +
    theme(panel.border = element_blank(),
          plot.caption=element_text(hjust=1, size=9,
                                    margin=margin(t=10),
                                    face="italic"),
          plot.title=element_text(hjust=0, size=18,
                                  margin=margin(b=10),
                                  face="bold"),
          axis.title.y=element_text(size=12,hjust=1,
                                    face="italic"),
          axis.title.x=element_text(hjust=1, size=12, face="italic"),
          legend.position = "bottom",
          legend.title = element_text(face="bold"))

}
