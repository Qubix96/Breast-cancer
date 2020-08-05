##Wybranie modelu

```{r}


library(olsrr)

lm <- lm(DONOR_AGE_AT_DIAGNOSIS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = AAS)

wszytskie_modele <- ols_step_all_possible(lm)

ols_step_both_aic(lm)

View(wszytskie_modele)

summary(lm)

```



##Bayes

```{r}
library("e1071")

nb <- e1071::naiveBayes(DONOR_AGE_AT_DIAGNOSIS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = AAS)


nb

```

##Linear and square classification

```{r}
ls <- MASS::lda(DONOR_AGE_AT_DIAGNOSIS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = AAS)

ls

```

##Logistic regression

```{r}
glm <- glm(DONOR_AGE_AT_DIAGNOSIS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = AAS)

glm

```

##Classyfication tree

```{r}


tree <- rpart::rpart(DONOR_AGE_AT_DIAGNOSIS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = AAS)


rpart.plot::rpart.plot(tree)

```

##Random forest

```{r}

AAS1 <- drop_na(AAS)

rf <- randomForest::randomForest(DONOR_AGE_AT_DIAGNOSIS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = AAS1)

rf


plot(rf)
```


```{r}
library(party)
summary3 <- drop_na(summary2)
treec <- ctree(DONOR_VITAL_STATUS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = summary3, controls = ctree_control(maxdepth=3))

plot(treec)
```

##Prepaing work with 4 nodes of processor

```{r}
library(parallel)

detectCores()

cluster <- makeCluster(3)
N <- 1

alm <- function(i, data) {
  lm(DONOR_AGE_AT_DIAGNOSIS ~  ALCOHOL_HISTORY + TABACCO_SMOKING_HISTORY_INDICATOR, data = data)
}
results <- parLapply(cluster, 1:N, alm, data = AAS, chunk.size = 100)

stopCluster(cluster)

as.data.frame(results)

results



```
## Janek
s <- as.data.frame(summary(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS))

selected_values <- s[s$`summary(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)` < 10, ]
selected_types_of_tumor <- as.vector(rownames(selected_values))
view(selected_types_of_tumor)

mapper_low_frequency_type <- function(type){
  type.convert()
  if (type %in% selected_types_of_tumor){
    return ("Other")
  } else {
    return (type)
  }
}

new_state_of_tumor = as.factor(c())

for (value in summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS){
  x <- mapper_low_frequency_type(value)
  new_state_of_tumor <- as.factor(c(new_state_of_tumor, x))
}

summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS <- new_state_of_tumor

summary(summary2$NOWAKRWAKOLUMNA)

##

y <- s %>% 
  filter(summary(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS) < 10)

x <- (summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)

selector <- function(x) {
  ifelse (x %in% y, return("TRUE"), return("NOT")) 
}

selector(x)

data <- summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS

for (value in data) {
  p <-selector(x)
  print(p)
} 

summary <- summary %>% 
  mutate(ICGC_DONOR_ID = as.factor(ICGC_DONOR_ID)) %>% 
  mutate(DONOR_SEX = as.factor(DONOR_SEX)) %>% 
  mutate(DONOR_VITAL_STATUS = as.factor(DONOR_VITAL_STATUS)) %>% 
  mutate(DONOR_AGE_AT_DIAGNOSIS = as.integer(DONOR_AGE_AT_DIAGNOSIS)) %>% 
  mutate(DONOR_TUMOUR_STAGE_AT_DIAGNOSIS = as.factor(DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)) %>% 
  mutate(ALCOHOL_HISTORY = as.factor(ALCOHOL_HISTORY)) %>% 
  mutate(TABACCO_SMOKING_HISTORY_INDICATOR = as.factor(TABACCO_SMOKING_HISTORY_INDICATOR)) %>% 
  mutate(DONOR_HAS_RELATIVE_WITH_CANCER_HISTORY = as.factor(DONOR_HAS_RELATIVE_WITH_CANCER_HISTORY)) %>% 
  mutate(RELATIONSHIP_TYPE = as.factor(RELATIONSHIP_TYPE)) %>% 
  mutate(RELATIONSHIP_TYPE_OTHER = as.factor(RELATIONSHIP_TYPE_OTHER)) %>% 
  mutate(RELATIONSHIP_SEX = as.factor(RELATIONSHIP_SEX)) %>% 
  mutate(RELATIONSHIP_AGE = as.integer(RELATIONSHIP_AGE)) %>% 
  mutate(RELATIONSHIP_DISEASE = as.factor(RELATIONSHIP_DISEASE))


summary2 <- distinct(summary) %>% 
  group_by(ICGC_DONOR_ID)

summary2$DONOR_VITAL_STATUS <- as.character(summary2$DONOR_VITAL_STATUS)
summary2$DONOR_VITAL_STATUS[is.na(summary2$DONOR_VITAL_STATUS)] <- "not given" 
summary2$DONOR_VITAL_STATUS <- as.factor(summary2$DONOR_VITAL_STATUS)

summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS <- as.character(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)
summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS[is.na(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)] <- "lack"
summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS <- as.factor(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)


s <- summary(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)
s <- as.data.frame(s)
s$name <- (row.names(s))




# y <- s %>% 
#      filter(name < 10)
# 
# 
# x <- (summary$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)
# 
# selector <- function(x) {
#   ifelse (x %in% y, return("TRUE"), return("NOT")) 
#   }
# 
# selector(x)
# 
# data <- summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS
# 
# for (value in data) {
#   p <-selector(x)
#   print(p)
# } 

library(assertthat)  

k=1

for (i in as.list(is.string(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS))) {
  if (s$s < 10 | i %in% as.list(is.string(s$name))) {
    summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS[k] <- as.factor("Ovary")}
  
}



# 
# for (factor in 1:length(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)){
#   factor = factor + 1
#   state = levels(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)[factor]
#   
#   if (state %in% y$s){
#     levels(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)[factor] <- "Other"
#     levels(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)["0", "1"] <- "Other"
#   }
# }
# 




summary(summary2$DONOR_TUMOUR_STAGE_AT_DIAGNOSIS)


fourth_analysis <- first_analysis %>% 
  select(ICGC_DONOR_ID, RELATIONSHIP_DISEASE, RELATIONSHIP_TYPE_OTHER, DONOR_HAS_RELATIVE_WITH_CANCER_HISTORY) %>% 
  filter(DONOR_HAS_RELATIVE_WITH_CANCER_HISTORY == "yes") %>% 
  mutate(RELATIONSHIP_DISEASE = as.factor(RELATIONSHIP_DISEASE)) %>% 
  mutate(RELATIONSHIP_TYPE_OTHER = as.factor(RELATIONSHIP_TYPE_OTHER)) %>% 
  drop_na


c("fourth_analysis","RELATIONSHIP_DISEASE", "ovarian")

c <- function(f,w,before){
  x <- paste0(f,"$",w)
  for (i in eval(parse(text = x))) {
    g <- grepl(before, i)
    if (g == T) {eval(parse(text = x))[eval(parse(text = x)) %in% i] <- "super"
    }
  }
}

