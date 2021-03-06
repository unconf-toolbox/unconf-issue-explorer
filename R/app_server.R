#' @import shiny
#' @import shinyjs
#' @import shinyalert
app_server <- function(input, output, session) {
  # List the first level callModules here
  
  repos_df <- reactiveVal(
    repositories
  )
  
  observeEvent(
    eventExpr = input$add_repo, {
      
      repos_with_new_df <- add_repo(
        repos_df(),
        input$new_repo_owner,
        input$new_repo_name,
        input$new_repo_label
      )
      
      if(repos_with_new_df == "404"){
        shinyalert::shinyalert(
          title = "Whoops!",
          text = "Sorry, that's not a valid GitHub repo.",
          closeOnEsc = TRUE,
          closeOnClickOutside = TRUE,
          html = FALSE,
          type = "error",
          confirmButtonText = "I'll try again!",
          confirmButtonCol = "#AEDEF4",
          timer = 0,
          imageUrl = "",
          animation = TRUE
        )
        
        reset("new_repo_owner")
        reset("new_repo_name")
        reset("new_repo_label")
      }
      else if(repos_with_new_df == "invalid_label"){
        shinyalert::shinyalert(
          title = "Almost!",
          text = "There's no issues with that label in the repo you supplied. Want to check again?",
          closeOnEsc = TRUE,
          closeOnClickOutside = TRUE,
          html = FALSE,
          type = "warning",
          confirmButtonText = "Ok!",
          confirmButtonCol = "#AEDEF4",
          timer = 0,
          imageUrl = "",
          animation = TRUE)
      }
      else{
        repos_df(repos_with_new_df)
        
        reset("new_repo_owner")
        reset("new_repo_name")
        reset("new_repo_label")
      }
    }
  )
  
  callModule(mod_issue_viewer, "issue_viewer_open", repos_df = repos_df, issue_type = "open", collapsed = TRUE)
  
  callModule(mod_issue_viewer, "issue_viewer_closed", repos_df = repos_df, issue_type = "closed", collapsed = FALSE)
}
