#데이터 프레임 생성
df1 <- data.frame(id = c(1, 2, 3, 4, 5),
                  value1 = c(60, 80, 70,90,85))

df2 <- data.frame(id = c(1, 2, 3, 4, 5),
                  value2 = c(70,83,65,95,80))

df1
df2

# id 를 기준으로 열을 합친다. (id의 값이 같은 것 끼리 짝을 이룬다.)

df3 <- left_join(df1, df2, by = 'id')
df3


#id 값이 다르게 되어 있는 데이터 프레임 합치기

df4 <- data.frame(id = c(1, 2, 3, 4, 6),
                  value2 = c(70,83,65,95,80))

df5 <- data.frame(id = c(1, 2, 3, 4, 7),
                  value2 = c(70,83,65,95,80))

df6 <- left_join(df4, df5, by = 'id')


# 기준이 되는 특성의 개수가 맞지 않을 경우
df7 <- data.frame(id = c(1, 2, 3, 4, 5),
                  value1 = c(60, 80, 70,90,85))

df8 <- data.frame(id = c(1, 2, 3, 4),
                  value2 = c(70,83,65,95))

df9 <- left_join(df7, df8, by = 'id')
df9


# 행 합친다.
df19 <- data.frame(id = c(1, 2, 3, 4),
                  value = c(70,83,65,95))

df20 <- data.frame(id = c(1, 2, 3, 4),
                  value = c(70,83,65,95))

df21 <- bind_rows(df19,df20)
df21
