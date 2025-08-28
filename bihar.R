rm(list = ls())

library(ggplot2)
library(tidyverse)
require(cowplot)

bihar_data <- read_csv("Bihar_sample_data.csv")
view(bihar_data)


#make it for female

bihar_adult_female <- filter(bihar_data, adult==1, female==1)

#check histogram
ggplot(bihar_adult_female,
       aes(height_cm)) +
  geom_histogram(fill='blue',
                 color ='darkblue') +
  xlab("Height in cm, Bihar Females")
ggsave("output/bihar")


#distribution looks like some data are very small: filter

bihar_adult_female_trunc <- filter(bihar_adult_female, height_cm > 120, height_cm < 200)


ggplot(bihar_adult_female_trunc,
       aes(height_cm)) +
  geom_histogram(fill='blue',
                 color ='darkblue') +
  xlab("Height in cm, Bihar Females")
ggsave("output/bihar_female_trunc")


bihar1 <- ggplot(bihar_adult_female_trunc,
                 aes(height_cm)) +
  geom_histogram(fill='blue',
                 color='darkblue',
                 binwidth =5) +
  xlab("bind width = 5") +
  ylab("")


bihar2 <- ggplot(bihar_adult_female_trunc,
                 aes(height_cm)) +
  geom_histogram(fill='blue',
                 color='darkblue',
                 binwidth =10) +
  xlab("bind width = 10") +
  ylab("")


bihar3 <- ggplot(bihar_adult_female_trunc,
                 aes(height_cm)) +
  geom_histogram(fill='blue',
                 color='darkblue',
                 binwidth =20) +
  xlab("bind width = 20") +
  ylab("")


bihar4 <- ggplot(bihar_adult_female_trunc,
                 aes(height_cm)) +
  geom_histogram(fill='blue',
                 color='darkblue',
                 binwidth =50) +
  xlab("bind width = 50") +
  ylab("")


plot_grid(bihar1, bihar2, bihar3, bihar4, labels='Female Height in Bihar',
          hjust=-1,
          vjust=0.2
          )




#US
us_data <- read.csv("US_sample_data.csv")
us_adult_female_trunc <- filter(us_data, female ==1, adult==1, height_cm > 120, height_cm < 200)


ggplot(us_adult__female_trunc,
       aes(height_cm)) +
  geom_histogram(fill = 'red',
                        color ='darkred')+
  xlab('height in cm, us female') 



ggplot(us_adult_female_trunc,
                aes(height_cm)) +
  geom_histogram(data=us_adult_female_trunc,
                 aes(height_cm,
                      ..density..),
                 fill='white',
                 color='darkred') +
  geom_density(kernel='gaussian',
               aes(height_cm))


us1 <- ggplot(us_adult_female_trunc,
              aes(height_cm)) +
  geom_histogram(data=us_adult_female_trunc,
                 aes(height_cm,
                     ..density..),
                 fill='white',
                 color='darkred') +
  geom_density(kernel='gaussian',
               aes(height_cm), bw=1) +
  xlab("bw=1") +
  ylab("")


us2 <- ggplot(us_adult_female_trunc,
              aes(height_cm)) +
  geom_histogram(data=us_adult_female_trunc,
                 aes(height_cm,
                     ..density..),
                 fill='white',
                 color='darkred') +
  geom_density(kernel='gaussian',
               aes(height_cm), bw=5) +
  xlab("bw=5") +
  ylab("")

us3 <- ggplot(us_adult_female_trunc,
              aes(height_cm)) +
  geom_histogram(data=us_adult_female_trunc,
                 aes(height_cm,
                     ..density..),
                 fill='white',
                 color='darkred') +
  geom_density(kernel='gaussian',
               aes(height_cm), bw=10) +
  xlab("bw=10") +
  ylab("")

us4 <- ggplot(us_adult_female_trunc,
                  aes(height_cm)) +
  geom_histogram(data=us_adult_female_trunc,
                 aes(height_cm,
                     ..density..),
                 fill='white',
                 color='darkred') +
  geom_density(kernel='gaussian',
               aes(height_cm), bw=20) +
  xlab("bw=20") +
  ylab("")



plot_grid(us1, us2, us3, us4,
          labels='female height in the US',
          hjust = -1,
          vjust = 0.2)



#combining

ggplot(bihar_adult_female_trunc,
       aes(height_cm)) +
  geom_histogram(data=bihar_adult_female_trunc,
                 aes(height_cm),
                 fill = 'blue',
                 color="darkblue") +
  geom_histogram(data=us_adult_female_trunc,
                 aes(height_cm),
                 fill = 'red',
                 color="darkred")



ggplot(bihar_adult_female_trunc, aes(height_cm)) +
  geom_histogram(data=bihar_adult_female_trunc,
                 aes(height_cm, ..density..), 
                 fill = 'blue',
                 color = 'darkblue') +
  geom_histogram(data=us_adult_female_trunc,
                  aes(height_cm, ..density..),
                  fill = 'red',
                  color = 'darkred')+
                   xlab('height in centimeter')
                   


#kernel density
ggplot(bihar_adult_female_trunc,
       aes(height_cm)) +
  geom_density(data=bihar_adult_female_trunc, aes(height_cm),
               color='darkblue') +
  geom_density(data = us_adult_female_trunc, aes(height_cm),
               color='darkred') +
  xlab('height in centimeter')


#cdf


ggplot(bihar_adult_female_trunc,
       aes(height_cm)) +
  stat_ecdf(data = bihar_adult_female_trunc, aes(height_cm), color='darkblue')+
  stat_ecdf(data = us_adult_female_trunc, aes(height_cm), color='darkred') +
  xlab('height in centimeter')









