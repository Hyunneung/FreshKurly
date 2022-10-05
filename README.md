# <img width="150" src="https://github.com/Hyunneung/FreshKurly/blob/main/Fresh_Kurly/src/main/webapp/assets/image/logo/logo.png">


## 개요
* 성장 여력이 크나 타 산업 대비 낮은 온라인 침투율에 주안점을 두어, 현재 서비스 중인 마켓컬리를 벤치마킹해 식자재를 판매하는 웹사이트를 개발했습니다.
* 인원 : 4명
* 개발 기간 : 2022.08.03 ~ 2022.08.17 (14일)

---
## 맡은 기능
### 1. 로그인, 로그아웃, 회원가입
  - 회원가입시 이메일 인증
  - 소셜 회원가입, 로그인 (카카오, 네이버)
### 2. 장바구니
  - CRUD(생성, 조회, 갱신, 삭제)
### 3. 찜한상품
  - CRUD(생성, 조회, 갱신, 삭제)
### 4. 게시판
  - 조회, 삭제
  - 페이지네이션
### 5. 개인정보 수정

---
## 개발환경
* OS : Window 10
* DBMS : Oracle 11g
* Editer : Eclipse
* Database : SQL Developer
* Team Collaboration Tool : GitHub, Gather, Microsoft 365


---
## 사용기술
- Back-end
  - Language : Java11, Oracle SQL
  - Was : Apache Tomcat
- Front-end
  - HTML, CSS, JavaScript(jQuery, Ajax), Bootstrap5
- API
  - Kakao Login API
  - Naver Login API
  - Daum 우편번호 API

---
## Database ERD
![image](https://user-images.githubusercontent.com/104151569/193616223-247a3400-48a6-415b-b716-68ee9c2bc643.png)

---
## 화면 및 사용기술 설명
### 1. 로그인, 로그아웃, 회원가입
#### 1-1. 로그인
##### 1-1-1 일반 로그인
![image](https://user-images.githubusercontent.com/104151569/193631510-1372d009-b335-4389-87f1-a28bc1623d07.png)
##### 1-1-2 네이버 소셜 로그인
![image](https://user-images.githubusercontent.com/104151569/193986106-5639413b-b8e8-4bef-b366-88309c06719a.png)
##### 1-1-3 카카오 소셜 로그인
![image](https://user-images.githubusercontent.com/104151569/193986177-3727394f-8588-4f8c-8192-707e5c322bce.png)

#### 1-2. 로그아웃

#### 1-3. 회원가입
![image](https://user-images.githubusercontent.com/104151569/193631006-ecaedf53-dab6-4c09-a855-80ca570773f1.png)
![image](https://user-images.githubusercontent.com/104151569/193631026-b375af07-046c-43d8-8e1d-9bfb123ca040.png)
![image](https://user-images.githubusercontent.com/104151569/193632450-23ba5224-9f1c-4d4b-8d56-f0b216186f97.png)

##### &nbsp;(1) 아이디<br>
##### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193986819-06ed56f6-fae3-4107-8f5a-833229bc5fe0.png)<br>
##### &nbsp;&nbsp;&nbsp;② Ajax, JDBC 활용한 ID 중복 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193987133-e0250fac-fba9-4e1c-a482-a60217637d29.png)
  ![image](https://user-images.githubusercontent.com/104151569/193987138-353e9e16-7499-445a-a088-fcae6de89f81.png)

##### &nbsp;(2) 비밀번호, 비밀번호 확인<br>
##### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193989179-8e9ae8e5-4db5-47ee-9ca7-3b9864af9b82.png)
##### &nbsp;&nbsp;&nbsp;② Javascript(jQuery) 활용한 비밀번호 보기/숨기기<br>
  ![image](https://user-images.githubusercontent.com/104151569/193989198-96255742-cb42-43fe-9d4d-0cacabd23408.png)

##### &nbsp;(3) 주민번호<br>
##### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사 및 성별 자동 선택<br>
  ![image](https://user-images.githubusercontent.com/104151569/193989791-e949221e-384c-4cf3-bfc1-a257d34a805f.png)
  ![image](https://user-images.githubusercontent.com/104151569/193990595-30dfdb50-f34a-48ee-af3e-119c687f3d03.png)

##### &nbsp;(3) 이메일<br>
##### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193990266-0e083ce3-213e-4b2c-8c29-020885930aa4.png)
##### &nbsp;&nbsp;&nbsp;② Ajax, JDBC 활용한 ID 중복 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193990255-4d3e93b0-cc3b-4373-bab1-a2e13147c2a5.png)
##### &nbsp;&nbsp;&nbsp;③ JavaMail API 활용한 이메일 인증<br>
  ![image](https://user-images.githubusercontent.com/104151569/193990332-03c82bdf-3311-4a70-a88b-7b173e9927cb.png)

##### &nbsp;(4) 휴대폰<br>

##### &nbsp;(5) 우편번호<br>

##### &nbsp;(6) 이용약관동의<br>

##### &nbsp;(4) 휴대폰<br>


<br><br>
#### 2. 장바구니
<br><br>
#### 3. 찜한상품
<br><br>
#### 4. 게시판
<br><br>
#### 5. 개인정보 수정






