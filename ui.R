library(shiny)

fluidPage(
  titlePanel("Upload College Syllabus"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Select the college',
                accept=c('text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';'),
                   ',')
    ),
    mainPanel(
      tableOutput('contents')
    )
  )
)
