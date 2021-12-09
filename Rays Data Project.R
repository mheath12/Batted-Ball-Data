bbdata<-read.csv("/Users/matthewheath/Downloads/battedBallData.csv")
bbdata$speedDiff<-bbdata$speed_B-bbdata$speed_A
bbdata$angleDiff<-bbdata$vangle_B-bbdata$vangle_A
bbdata$speed_A[is.na(bbdata$speed_A)]<-bbdata$speed_B[is.na(bbdata$speed_A)]
bbdata$vangle_A[is.na(bbdata$vangle_A)]<-bbdata$vangle_B[is.na(bbdata$vangle_A)]
#since we have deemed system A to be more reliable, we will use System A's measurements. If A is missing, the measurements from B will be used

hittype<-split(bbdata,bbdata$hittype)
ground<-as.data.frame(hittype$ground_ball)
fly<-as.data.frame(hittype$fly_ball)
line<-as.data.frame(hittype$line_drive)
pop<-as.data.frame(hittype$popup)
#converted the list into separate lists for each hit type
#2 data points had a hit classification of U, so I eliminated from set bc sample size is large

hist(ground$speedDiff)
hist(fly$speedDiff)
hist(line$speedDiff)
hist(pop$speedDiff)

hist(ground$angleDiff)
hist(fly$angleDiff)
hist(line$angleDiff)
hist(pop$angleDiff)
#system B tends to provide lower exit velocities across all hit types. In particular, the difference between system A and B seems to be largest for ground balls.
#there is no overall trend for the difference between launch angles, however for fly balls the measurements for system B tend to be higher, while for line drives the measurements for system B tend to be lower.

Velo<-aggregate(speed_A~batter, bbdata, mean)
Angle<-aggregate(vangle_A~batter, bbdata, mean)
table(bbdata$batter)
#calculated overall average exit velocities for each batter. Table shows counts to cross reference sample size

table(ground$batter)
table(fly$batter)
table(line$batter)
table(pop$batter)
#tables show counts to determine validity of estimates

gVelo<-aggregate(speed_A~batter, ground, mean)
fVelo<-aggregate(speed_A~batter, fly, mean)
lVelo<-aggregate(speed_A~batter, line, mean)
pVelo<-aggregate(speed_A~batter, pop, mean)
#calculated average exit velocities per hit type

fAngle<-aggregate(vangle_A~batter, fly, mean)
lAngle<-aggregate(vangle_A~batter, line, mean)
#launch angle is most important for line drives and fly balls, so average launch angles were only calculated for these hit types


