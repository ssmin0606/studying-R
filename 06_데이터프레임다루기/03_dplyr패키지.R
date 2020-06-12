# dplyr 패키지 : 데이터 프레임으로 관리되는 데이터에 대한 가공, 추출 등 다양한 작업을 할 수 있도록 지원되는 패키지

install.packages("dplyr")
library(dplyr)

# 사용할 데이터를 읽어와 데이터 프레임으로 생성한다.
exam <- read.csv("csv_exam.csv")
exam

View(exam)
head(exam)


# filter : 원하는 조건에 만족하는 로우만 가져온다.
# == 같다, !=다르다, >크다, < 작다, 


# class가 1인 로우를 추출한다.
exam %>% filter(class ==1)

# class가 2인 로우를 추출한다
exam %>% filter(class ==2)

# class가 1이 아닌 로우를 추출한다.
exam %>% filter(class !=1)

# class가 3이 아닌 로우를 추출한다.
exam %>% filter(class !=3)


# 수학 점수가 50점 초과인 경우
exam %>% filter(math > 50)


# & : 모든조건을 만족
# | : 조건 중 하나만 만족

# class가 1이면서 수학점수가 50점 이상인 경우
exam %>% filter(class ==1 & math >= 50)

# class가 2 이면서 영어점수가 80점 이상인 경우
exam %>% filter(class ==2 & english >= 80)

# 수학점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)

# 영어점수가 90점 이상이거나 과학점수가 50점 미만인 경우
exam %>% filter(english >= 90 | science < 50)


class1 <- exam %>% filter(class ==1 & math >= 50)
mean(class1$math)


# select : 지정된 특성만 가져오거나 제회해서 가져온다.
# math 특성만 추출
exam %>% select(math)

# english 특성만 추출
exam %>% select(english)

# class, math, english 특성 추출
exam %>% select(class, math, english)

# 제외하고 가져오기
exam %>% select(-math)
exam %>% select(-math, -english)


#조합하기
# class가 1인 행만 추출한 다음에 english를 추출한다.
exam %>% filter(class == 1) %>% select(class, english)

# math가 20보다 큰 학생들의 class와 math를 상위 10개만 가져온다
exam %>% filter(math > 20) %>% select(class, math) %>%head(10)

# 정렬
# arrange(특성) : 주어진 특성을 기준으로 오름차순 정렬
# arrange(desc(특성)) : 주어진 특성을 기준으로 내림차순 정렬
# arrange(특성1, 특성2,,,,) : 특성1을 기준으로 정렬을 하고 특성1에서 값이 같은 것 끼리 특성2를 기준으로 정렬한다.

#class를 기준으로 오름차순 정렬
exam %>% arrange(class)

# class를 기준으로 내림차순 정렬
exam %>% arrange(desc(class))

# class를 기준으로 내림차순, math를 기준으로 오름차순
exam %>% arrange(desc(class), math)


# 파생변수
# 수학, 영어, 과학의 총점을 가지고 있는 파생변수를 추가한다.
df1 <- exam %>% mutate(total = math + english + science)
df1

# 파생변수를 두개 이상 추가하겠다면 쉼표를 구분하여 작성한다.
df2 <- exam %>% mutate(total = math + english + science, avg=(math+english+science)/3)
df2

# 조건에 의해 값을 구해서 추가할 때는 ifelse를 사용한다.
df3 <- exam %>% mutate(test= ifelse(math >= 60, "pass", "fail"))
df3


# group_by: 지정된 특성에 저장되어 있는 값이 같은 것 끼리 그룹으로 묶인 후 통계량을 구할 때 사용한다.

df7 <- exam %>%
        group_by(class) %>%
                    summarise(평균 = mean(math),
                              표준편차 = sd(math),
                              합계 = sum(math),
                              중앙값 = median(math),
                              최소값 = min(math),
                              최대값 = max(math),
                              빈도 = n())
View(df7)                       

# 각 회사별 suv 자동차의 통합 연비를 기준으로 내림 차순 정렬하여 상위 5개를 가져온다.

mpg <- as.data.frame(ggplot2::mpg)
mpg

df10 <- mpg %>% filter(class == "suv") %>%
        mutate(tot = (cty + hwy) / 2) %>%
        group_by(manufacturer) %>%
        summarise(mean_tot= mean(tot)) %>%
        arrange(desc(mean_tot)) %>%
        head(5)

View(df10)


# 데이터 프레임 생성

df1 <-




