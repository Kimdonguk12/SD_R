# jdk 받고   
#콘솔창에 
#install.packages("remotes")
#설치되면
#remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
#문서폴더에 잠이 오질 않네요.txt 파일 받아서 넣으세요


install.packages("stringi")
library(stringi)

getwd() #현재 지정된 작업경로
install.packages("wordcloud2")  #패키지 설치
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271')
library(KoNLP) #라이브러리로 KoNLP 불러오기
library(wordcloud2) #라이브러리 불러오기

useSejongDic()#한국어 사전 로딩

텍스트파일자체<-file("잠이 오질 않네요.txt", encoding = "UTF-8") #file() 잠이 오질 않네요 라는 텍스트 문서 받아 변수에 저장 utf-8형식으로 불러오기 
텍스트파일내용 <- readLines(텍스트파일자체) #readLines()로 한줄 한줄씩 읽어 텍스트파일 내용에 저장 
close(텍스트파일자체) #close() 파일 닫기 

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F) #명사만 고르기
명사만 <- unlist(명사만) #데이터 벡터

head(명사만, 30) #30개만 출력

중복횟수 <- table(명사만) 

head(sort(중복횟수, decreasing = T), 30)
#워드 클라우드 생성
wordcount2 <- head(sort(중복횟수, decreasing=T),30)
wordcloud2(wordcount2,gridSize=10,size=1,shape="circle")
