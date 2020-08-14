kw_dates <- readxl::read_excel(here::here("analysis", "data", "raw_data", "KWL_C14_dates.xlsx"))
library(tidyverse)
# subset dates with error value
kw_dates_with_error <-
  kw_dates  %>%
  filter(!is.na(se))

# convert rce to numeric
kw_dates_with_error$rce <- as.numeric(kw_dates_with_error$rce)

# make some kind of ID
kw_dates_with_error$id <- with(kw_dates_with_error,
                               paste0(Square,"-",Layer))

# Use oxcAAR to clibrate
library(devtools)
install_github('ISAAKiel/oxcAAR')
library(oxcAAR)
quickSetupOxcal()
date_kwl <- oxcalCalibrate(kw_dates_with_error$rce,
                           kw_dates_with_error$se,
                           kw_dates_with_error$`Lab code`)
date_kwl
plot(date_kwl)

# for modeling
kw_dates_with_error_three_phases <-
  kw_dates_with_error %>%
  filter(rce < 600) %>%
  mutate(phase = rce) %>%
  mutate(phase = ifelse(rce > 324, "Pre European", phase),
         phase = ifelse(rce < 324, "Post European", phase)) %>%
  select(`Lab code`, "rce", "se", "phase")


three_phases <- 'Plot()
{
 Phase("Upper Layer")
 {
    Sequence()
    {
      Boundary("Start of Pre-European");
      Phase()
      {
        R_Date("NTU-3791", 340, 30);
        R_Date("NTU-4292", 510, 75);
        R_Date("NTU-4310", 360, 100);
        R_Date("NTU-4320", 340, 100);
        Interval( "Duration of Pre-European");
      };
        Boundary("End of Pre-European");
    };
  Sequence()
    {
   Boundary( "Start of Post-European");
   Phase( )
        {
        R_Date("NTU-3993", 250, 40);
        R_Date("NTU-4016", 270, 45);
        R_Date("NTU-4311", 310, 100);
        R_Date("NTU-4419", 280, 70);
        Interval("Duration of Post-European");
        };
      Boundary("End of Post-European");
    };
  };
};
'
three_phases_results <- executeOxcalScript(three_phases)
three_phases_text <- readOxcalOutput(three_phases_results)
three_phases_result_data <- parseOxcalOutput(three_phases_text, only.R_Date = F)
str(three_phases_result_data)
print(three_phases_result_data)
plot(three_phases_result_data)

three_phases_con <- 'Plot()
{
    Sequence("Upper Layer")
    {
      Boundary("Start of Pre-European");
      Phase()
      {
        R_Date("NTU-3791", 340, 30);
        R_Date("NTU-4292", 510, 75);
        R_Date("NTU-4310", 360, 100);
        R_Date("NTU-4320", 340, 100);
        Interval( "Duration of Pre-European");
      };
        Boundary("Pre-European - Post-European");
      Phase()
      {
        R_Date("NTU-3993", 250, 40);
        R_Date("NTU-4016", 270, 45);
        R_Date("NTU-4311", 310, 100);
        R_Date("NTU-4419", 280, 70);
        Interval("Duration of Post-European");
      };
      Boundary("End of Post-European");
    };
};
'
three_phases_con_results <- executeOxcalScript(three_phases_con)
three_phases_con_text <- readOxcalOutput(three_phases_con_results)
three_phases_result_con_data <- parseOxcalOutput(three_phases_con_text, only.R_Date = F)
str(three_phases_result_con_data)
print(three_phases_result_con_data)
plot(three_phases_result_con_data)

