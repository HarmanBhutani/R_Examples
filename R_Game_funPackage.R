install.packages("fun")
library(fun)

demo(package="fun")

mine_sweeper()
?mine_sweeper


if (interactive()) {
  if (.Platform$OS.type == "windows") 
    x11() else x11(type = "Xlib")
  mine_sweeper()
}
