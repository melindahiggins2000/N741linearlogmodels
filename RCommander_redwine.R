
names(redwine) <- make.names(names(redwine))
LinearModel.1 <- lm(quality ~ alcohol + chlorides + citric.acid + density + 
  fixed.acidity + free.sulfur.dioxide + pH + residual.sugar + sulphates + 
  total.sulfur.dioxide + volatile.acidity, data=redwine)
summary(LinearModel.1)
library(MASS, pos=15)
stepwise(LinearModel.1, direction='backward/forward', criterion='BIC')
summary(LinearModel.1)
Confint(LinearModel.1, level=0.95)
vif(LinearModel.1)
oldpar <- par(oma=c(0,0,3,0), mfrow=c(2,2))
plot(LinearModel.1)
par(oldpar)
qqPlot(LinearModel.1, simulate=TRUE, id.method="y", id.n=2)
influencePlot(LinearModel.1, id.method="noteworthy", id.n=2)
library(effects, pos=16)
plot(allEffects(LinearModel.1))

