# ggplot2 : R 에서 사용하는 데이터 시각화용 패키지
# 비교적 사용하기가 간단하고 다양한 그래프를 제공하고 있어서 가장 많이 사용한다.
install.packages("ggplot2")
library(ggplot2)

# 산점도: 두 가지 특성을 이용해 점으로 표현한 그래프
# 데이터의 분포를 확인하는 용도로 많이 사용한다.

# 그래프의 배경을 설정
ggplot(data = mpg, aes(x = displ, y = hwy))

# 산점도를 그린다.
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 추가 옵션 설정
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() + xlim(3, 6) + ylim(10, 30)


# 막대 그래프 : 데이터들을  막대로 표현한 그래프
# 어떤 특서의 값을 그룹 별로 비교하기 위해 사용.
# 양을 비교하는 용도.

library(dplyr)

# 그래프를 그리기 위한 데이터를 준비.
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))  

df_mpg

# 막대 그래프를 그린다.
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) +
  geom_col()


#선 그래프 : 흐름에 따른 데이터 변화 추이를 보기위해 사용한다.
# 시계열 데이터 : 시간의 흐름에 따라 변화된ㄷ 데이터

ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

