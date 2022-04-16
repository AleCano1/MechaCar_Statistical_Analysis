library(dplyr)

#Linear regression to predict MPG
MechaCar_table <- read.csv(file='Resources/MechaCar_mpg.csv')
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_table) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_table))

#Summary Statistics on suspension Coils
Suspension_coil <- read.csv(file='Resources/Suspension_Coil.csv')
total_summary <- Suspension_coil  %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table
lot_summary <- Suspension_coil  %>%group_by(Manufacturing_Lot)%>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table

#T-test on suspension Coils
t.test(Suspension_coil$PSI,mu=mean(1500)) #compare sample versus population means
t.test(subset(Suspension_coil,Manufacturing_Lot == "Lot1")$ PSI,mu=mean(1500)) 
t.test(subset(Suspension_coil,Manufacturing_Lot == "Lot2")$ PSI,mu=mean(1500))
t.test(subset(Suspension_coil,Manufacturing_Lot == "Lot3")$ PSI,mu=mean(1500))