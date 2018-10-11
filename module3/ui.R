
library(shiny)

bsl <- read.csv(url('https://raw.githubusercontent.com/solaojp/CUNY_DATA_608/master/module3/data/cleaned-cdc-mortality-1999-2010-2.csv'))

# Define UI for application that draws a histogram
shinyUI(fluidPage(titlePanel("Mortality Rates across different states"),
  tabsetPanel(type = "tab",
      tabPanel("Question 1",sidebarLayout(sidebarPanel(
      selectInput("Year","Select time period:", choices = 1999:2010,selected = 2010),
      selectInput("ICD.Chapter","Select the Disease:",choices = c("Neoplasms","Certain conditions originating in the perinatal period" ,                                            
                                                          "Certain infectious and parasitic diseases",                                                          
                                                          "Congenital malformations, deformations and chromosomal abnormalities",                               
                                                          "Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism",
                                                          "Diseases of the circulatory system",                                                                 
                                                          "Diseases of the digestive system",                                                                   
                                                          "Diseases of the ear and mastoid process",                                                            
                                                          "Diseases of the genitourinary system" ,                                                              
                                                          "Diseases of the musculoskeletal system and connective tissue" ,                                      
                                                          "Diseases of the nervous system",                                                                     
                                                          "Diseases of the respiratory system",                                                                 
                                                          "Diseases of the skin and subcutaneous tissue",                                                       
                                                          "Endocrine, nutritional and metabolic diseases",                                                      
                                                          "External causes of morbidity and mortality",                                                         
                                                          "Mental and behavioural disorders",                                                                   
                                                          "Pregnancy, childbirth and the puerperium",                                                           
                                                          "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified"))),
    mainPanel(plotOutput("plot1")))),
    tabPanel("Question 2",sidebarLayout(sidebarPanel(
    selectInput("State","Select State:",choices = c("AL", "AK" ,"AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA" ,"HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO",
                                                    "MT", "NE", "NV", "NH" ,"NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")),
    selectInput("ICD.Chapter","Select the Disease:",choices = c("Neoplasms","Certain conditions originating in the perinatal period" ,                                            
                                                                "Certain infectious and parasitic diseases",                                                          
                                                                "Congenital malformations, deformations and chromosomal abnormalities",                               
                                                                "Diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism",
                                                                "Diseases of the circulatory system",                                                                 
                                                                "Diseases of the digestive system",                                                                   
                                                                "Diseases of the ear and mastoid process",                                                            
                                                                "Diseases of the genitourinary system" ,                                                              
                                                                "Diseases of the musculoskeletal system and connective tissue" ,                                      
                                                                "Diseases of the nervous system",                                                                     
                                                                "Diseases of the respiratory system",                                                                 
                                                                "Diseases of the skin and subcutaneous tissue",                                                       
                                                                "Endocrine, nutritional and metabolic diseases",                                                      
                                                                "External causes of morbidity and mortality",                                                         
                                                                "Mental and behavioural disorders",                                                                   
                                                                "Pregnancy, childbirth and the puerperium",                                                           
                                                                "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified"))),
  
    mainPanel(plotOutput("plot2"))))
)
)
)


