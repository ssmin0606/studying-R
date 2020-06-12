# 파생변수 : 데이터프레임이 관리하는 데이터들을 가지고 계산한 값을 같은 테이터프레임에 붙힐 때 사용한다.
df1 <- data.frame(var1 = c(4, 3, 8),
                  var2 = c(2, 6, 1))

df1                

df1$var1
df1$var2

df1$var1 + df1$var2

df1$total <-df1$var1 + df1$var2


df1$avg <- df1$total / 2

#######mpg 데이터 활용
mpg <- as.data.frame(ggplot2::mpg)
mpg


mpg$cty
mpg$hwy

# 통합 연비를 구한다.
View(mpg)
mpg$total <-(mpg$cty + mpg$hwy) /2
mpg$total


# 조건을 주고 계산한 값을 파생변수로 추가한다.
# 총합 연비가 20 이상이면 pass, 아니면 fail
summary(mpg$total)

# 조건에 만족하면 두 번째 값, 만족하지 않으면 세 번쨰 값이 결과가 된다.
mpg$test <- ifelse(mpg$total >=20, "pass", "fail")



#만약 pass와 fail의 빈도를 확인해야 한다면 table: 지정된 특성 내에 저장된 값들의 개수를 파악한다.
table(mpg$test)

# 빈도수 그래프
install.packages("ggplot2")
library(ggplot2)
qplot(mpg$test)


# mpg$total 값이 30 이상이면 "A", 20이상이면 "B" 그렇지 않으면 "C"로 하여
# grade라는 파생 변수를 생성한다.

ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "c"))

       