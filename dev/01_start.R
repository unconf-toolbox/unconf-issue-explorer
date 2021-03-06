# Building a Prod-Ready, Robust Shiny Application.
# 
# Each step is optional. 
# 
# 1 - On init
# 
## 1.1 - Fill the descripion
## 
## Add information about the package that will contain your app

golem::fill_desc(
  pkg_name = "unconfissues", # The Name of the package containing the App 
  pkg_title = 'Unconf issue explorer', # The Title of the package containing the App 
  pkg_description = 'Explore open and closed issues in unconf projects', # The Description of the package containing the App 
  author_first_name = 'Eric', # Your First Name
  author_last_name = 'Nantz',  # Your Last Name
  author_email = 'thercast@gmail.com',      # Your Email
  repo_url = 'https://github.com/unconf-toolbox/unconfissues')      # The (optional) URL of the GitHub Repo

## 1.2 - Set common Files 
## 
## If you want to use the MIT licence, README, code of conduct, lifecycle badge, and news

usethis::use_mit_license(name = "Eric Nantz")  # You can set another licence here
usethis::use_readme_rmd()
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge("Experimental")
usethis::use_news_md()

## 1.3 - Add a data-raw folder
## 
## If you have data in your package
usethis::use_data_raw()

## 1.4 - Init Tests
## 
## Create a template for tests

golem::use_recommended_tests()

## 1.5 : Use Recommended Package

golem::use_recommended_dep()

## 1. Add various tools

golem::use_utils_ui()
#golem::use_utils_prod()

# If you want to change the default favicon
golem::use_favicon( path = "path/to/favicon")


## 1.6 : Create your first module
## 
## Add a module file in your R folder with the recommended structure

golem::add_module(name = "my_first_module") #

## 1.7: Add a browser button

golem::add_browser_button()

