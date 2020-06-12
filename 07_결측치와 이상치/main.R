# 결측치 : 측정이 안된 데이터, 비어 있는 데이터
# 일부 함수에서 오류가 발생하거나 결과를 왜곡시킨다.
# 결측치 비율이 매우 낮다면 제거한다. 그렇지 않다면 데이터를 다시 확보하던가 무언가로 채워져야 한다.

#이상치 : 정상 범주를 벗어나는 값
#결과를 왜곡시킨다.
# 이상치 비율이 매우 낮다면 제거한다. 그렇지 않다면 보정해야 한다.

df1 <- data.frame(gender = c("M", "F", NA, "M", "F"),
                  score = c(5, 4, 3, 4, 5))

df1

#결측치를 확인
is.na(df1)
#각 특성별 결측지 빈도수 확인
table(is.na(df1$gender))

# 평균 산출 : R은 통계량 계산시 결측치가 있으면 결과는 NA다.
mean(df1$score)
sum(df1$score)

#결측치 제거
install.packages("dplyr")
library(dplyr)

df2 <- df1 %>% filter(is.na(score))
df2

#결측치가 없는 데이터만 모아 데이터 프레임으로 변환한다.
df3 <- df1 %>% filter(!is.na(score))

# 평균과 총합을 구한다.
mean(df3$score)
sum(df3$score)

# 모든 특성에 대해 결측치를 제거한다.
df4 <- df1 %>% filter(!is.na(score)& !is.na(gender))
df4

df5 <- na.omit(df1)
df5


#통계량을 구할 때 결측치가 있다면 제외하고 통계량 계산이 가능하다.
mean(df1$score, na.rm = T)
sum(df1$score, na.rm = T)


#결측치 부분에 다른 값으로 채워준 데이터 프레임을 생성한다.
# 성별이결측치라면 A로 설정해준다.
df1$gender <- ifelse(is.na(df1$gender), "A", df1$gender)
df1$gender


#