# 데이터 프레임 생성
df1 <- read.csv("csv_exam.csv")
df1

# 상의 6개를 출력해준다.
head(df1)

# 상위 n개를 출력해준다.
head(df1, 10)

# 하위 6개를 출력해준다.
tail(df1)

# 하위 n개를 가져온다.
tail(df1, 10)

# view 창에 정보를 출력한다.
View(df1)

# 행과 열의 수가 담긴 벡터를 반환한다.
dim(df1)

# 데이터 속성을 확인한다.
str(df1)

# 데이터 프레임의 종합적인 정보를 확인한다.
summary(df1)


#mpg 데이터 사용하기
#mpg 데이터
#자동차 정보, 문자열까지 포함되어 있다
install.packages("ggplot2")
library(ggplot2)

#mpg데이터 출력
ggplot2::mpg
#데이터 프레임 형태로 변경한다.
mpg_df = as.data.frame(ggplot2::mpg)
mpg_df

#상위 6개를 가져온다.
head(mpg_df)

#상위 10개를 가져온다.
head(mpg_df, 10)


#하위 10개를 가져온다.
tail(mpg_df, 10)

#view 화면에서 확인한다.
View(mpg_df)

# 행과 열의 정보
dim(mpg_df)

# 각 특성의 타입 정보
# chr: 문자열, num: 숫차(정수, 실수), int(정수)
str(mpg_df)
