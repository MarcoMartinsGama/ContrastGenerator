library(shiny)

# Workaround for Chromium Issue 468227
downloadButton <- function(...) {
  tag <- shiny::downloadButton("contrast", "Download contrast.txt")
  tag$attribs$download <- NULL
  tag}

fluidPage(
  titlePanel("Contrast.txt Generator"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Choose keys.txt File", accept = ".txt"),
      textInput("new_condition", "New Condition", ""),
      actionButton("add_condition", "Add Condition"),
      checkboxGroupInput("conditions", "Select Conditions", choices = NULL),
      actionButton("generate", "Generate Combination(s)")
    ),
    mainPanel(
      DT::dataTableOutput("table"),
      actionButton("swap", "Swap Selected Combination(s)"),
      actionButton("remove", "Remove Selected Combination(s)"),
      downloadButton("contrast", "Download contrast.txt"),
      verbatimTextOutput("output_text")
    )
  )
)

