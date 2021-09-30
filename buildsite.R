# Build script
# make sure to run  brew install pandoc if it gives errors.

rmarkdown::render("rmd/index.Rmd",output_dir='.', run_pandoc = TRUE, "all")
rmarkdown::render("rmd/booking.Rmd",output_dir='.',run_pandoc = TRUE, "all")
rmarkdown::render("rmd/events.Rmd",output_dir='.',run_pandoc = TRUE, "all")
rmarkdown::render("rmd/more_projects.Rmd",output_dir='.',run_pandoc = TRUE, "all")
rmarkdown::render("rmd/projects.Rmd",output_dir='.',run_pandoc = TRUE, "all")