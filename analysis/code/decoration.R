# Explore surface decoration
pottery_deco_by_phase <-
  pottery_data_tidy %>%
  select(Pit, Layer, `No.`, phase, `紋飾/腹片`) %>%
  pivot_wider(names_from = phase,
              values_from = `紋飾/腹片`) %>%
  mutate(`post-e`= str_remove_all(`post-e`, "[[:punct:]]"),
         `pre-e`= str_remove_all(`pre-e`, "[[:punct:]]"),
         `ch-con`= str_remove_all(`ch-con`, "[[:punct:]]"))

pottery_deco_table <-
  pottery_data_tidy %>%
  select(Pit, Layer, `No.`, phase, `紋飾/腹片`) %>%
  mutate(`紋飾/腹片`= str_remove_all(`紋飾/腹片`, "[[:punct:]]")) %>%
  count(phase, `紋飾/腹片`, name = "count") %>%
  group_by(phase) %>%
  mutate(sum = sum(count))

pottery_deco_count <-
  pottery_deco_table %>%
  count(phase, sum, name = "decoration_types") %>%
  mutate(ratio = round(decoration_types/sum, 2))

