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

# Use oxcAAR to calibrate
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

<<<<<<< HEAD
# use continguous example from
# https://c14.arch.ox.ac.uk/oxcalhelp/hlp_analysis_eg.html#phases
three_phases <- 'Plot()
{
 Phase("Upper Layer")
 {
    Sequence()
=======
# contiguous phases, not overlapping
three_phases_con <- 'Plot()
{
    Sequence("Upper Layer")
>>>>>>> 03f3a0a616fb71ee4b7128279b677a8cf681b075
    {
      Boundary("Start of Pre-European");
      Phase()
      {
<<<<<<< HEAD
        R_Date("NTU-4292", 510, 75);
        R_Date("NTU-4310", 360, 100);
        R_Date("NTU-4320", 340, 100);
        R_Date("NTU-3791", 340, 30);
        Interval( "Duration of Pre-European");
      };
   Boundary("Pre-European - Post-European");
   Phase( )
        {
=======
        R_Date("NTU-3791", 340, 30);
        R_Date("NTU-4292", 510, 75);
        R_Date("NTU-4310", 360, 100);
        R_Date("NTU-4320", 340, 100);
        Interval( "Duration of Pre-European");
      };
        Boundary("Pre-European - Post-European");
      Phase()
      {
>>>>>>> 03f3a0a616fb71ee4b7128279b677a8cf681b075
        R_Date("NTU-3993", 250, 40);
        R_Date("NTU-4016", 270, 45);
        R_Date("NTU-4311", 310, 100);
        R_Date("NTU-4419", 280, 70);
        Interval("Duration of Post-European");
<<<<<<< HEAD
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



=======
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
>>>>>>> 03f3a0a616fb71ee4b7128279b677a8cf681b075
