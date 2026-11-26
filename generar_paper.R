# Ejecutar desde la carpeta que contiene Cloud_Delphi.Rmd.
# Instalar una sola vez si es necesario:
# install.packages(c("rmarkdown", "knitr", "tinytex"))
# tinytex::install_tinytex() # si no hay una distribución LaTeX instalada
rmarkdown::render("Cloud_Delphi.Rmd", output_format = "pdf_document")
# Alternativa sin LaTeX instalado:
# rmarkdown::render("Cloud_Delphi.Rmd", output_format = "html_document")
