#데이터 프레임 : 행렬 구조로 되어 있는 데이터 관리 단위
#데이터 저장 뿐만 아니라 가공, 추가 등 다양한 처리가 가능하고 데이터 시각화도 처리할 수 있다.

#데이터 프레임 생성
english <- c(90,80,70,60)
math <- c(50,60,70,80)

df1 <- data.frame(english,math)
df1


##################################################################
# 엑셀 파일을 통해 데이터 프레임 생성하기
install.packages("readxl")
library(readxl)

# 엑셀 파일에서 데이터를 읽어온다(sheet 1개)
df5 <- read_excel("excel_exam.xlsx")

df5$english
df5$math

#특성 이름이 없는 엑셀 파일
# 엑셀 파일에서 데이터를 읽어오면 첫 번째 줄은 특성의 이름으로 취급한다.
# 만약 첫 줄부터 데이터라면 col_names에 F(첫번째 부터 데이터로 취급)를 넣어준다.
df6 <- read_excel("excel_exam_novar.xlsx")
df6

df7 <- read_excel("excel_exam_novar.xlsx", col_names = F)
df7

#엑셀 파일을 이용해 데이터 프레임 생성시 시트 번호를 지정하지 않으면 첫 번째 시트를 가지고 만든다.
#시트번호를 지정해야 한다면  sheet에 시트 번호 (1부터)를 지정한다.
df8 <- read_excel("excel_exam_sheet.xlsx", sheet=3)
df8


#######################################################################
# csv 파일 : 데이터를 쉼표(,)로 구분하는 양식
# 데이터의 총량이 작다는 장점을 가지고 있다.
df9 <- read.csv("csv_exam.csv")
df9

# Rdata 파일 : R 전용 데이터양식
# 데이터 프레임을 저장할 때 데이터 프레임을 가지고 있던 변수 명까지 같이 저장된다.
save(df9, file= "df9_rdata.rda")
# df9를 제거한다.
rm(df9)

# 파일을 저장했을 때 사용한 변수 이름인 df9라는 변수가 자동으로 만들어지고 거기에
# 데이터 프레임이 담긴다.
load("df9_rdata.rda")
df9
