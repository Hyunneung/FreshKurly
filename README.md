# <img width="150" src="https://github.com/Hyunneung/FreshKurly/blob/main/Fresh_Kurly/src/main/webapp/assets/image/logo/logo.png">


## 개요
* 성장 여력이 크나 타 산업 대비 낮은 온라인 침투율에 주안점을 두어, 현재 서비스 중인 마켓컬리를 벤치마킹해 식자재를 판매하는 웹사이트를 개발했습니다.
* 인원 : 4명
* 개발 기간 : 2022.08.03 ~ 2022.08.17 (14일)

---
## 맡은 기능
### 1. 로그인, 로그아웃, 회원가입
  - 이메일 인증
  - 유효성 검사
  - 소셜 회원가입, 로그인 (카카오, 네이버)
### 2. 마이페이지
  - 로그인 시에만 마이페이지 이용 가능
#### 2-1. 주문내역
  - 조회
#### 2-2. 장바구니
  - CRUD(생성, 조회, 수정, 삭제)
#### 2-3. 찜한상품
  - CRUD(생성, 조회, 수정, 삭제)
#### 2-4. 게시판
  - 조회, 삭제
  - 페이지네이션
#### 2-5. 개인정보 수정
  - 필수 데이터 자동 입력
  - 이메일 인증
  - 유효성 검사
  - 소셜 로그인 회원은 이용 불가

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
## 1. 로그인, 로그아웃, 회원가입
### 1-1. 로그인
#### 1-1-1 일반 로그인
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery), JDBC 활용한 비밀번호 확인<br>
  ![image](https://user-images.githubusercontent.com/104151569/193631510-1372d009-b335-4389-87f1-a28bc1623d07.png)
#### 1-1-2 네이버 소셜 로그인
#### &nbsp;&nbsp;&nbsp;① Naver Login API, JDBC 활용한 소셜 회원가입 및 로그인<br>
  ![image](https://user-images.githubusercontent.com/104151569/193999911-902c4b16-8a2e-49c3-acfc-d1c83bfca06e.png)
#### 1-1-3 카카오 소셜 로그인
#### &nbsp;&nbsp;&nbsp;① Kakao Login API, JDBC 활용한 소셜 회원가입 및 로그인<br>
  ![image](https://user-images.githubusercontent.com/104151569/193999990-2e0e462e-84a2-44e4-a920-c4832e05bfce.png)

### 1-2. 로그아웃

### 1-3. 회원가입
![image](https://user-images.githubusercontent.com/104151569/193631006-ecaedf53-dab6-4c09-a855-80ca570773f1.png)
![image](https://user-images.githubusercontent.com/104151569/193631026-b375af07-046c-43d8-8e1d-9bfb123ca040.png)
![image](https://user-images.githubusercontent.com/104151569/193632450-23ba5224-9f1c-4d4b-8d56-f0b216186f97.png)

#### &nbsp;(1) 아이디<br>
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193986819-06ed56f6-fae3-4107-8f5a-833229bc5fe0.png)<br>
#### &nbsp;&nbsp;&nbsp;② Ajax, JDBC 활용한 ID 중복 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193987133-e0250fac-fba9-4e1c-a482-a60217637d29.png)
  ![image](https://user-images.githubusercontent.com/104151569/193987138-353e9e16-7499-445a-a088-fcae6de89f81.png)

#### &nbsp;(2) 비밀번호, 비밀번호 확인<br>
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193989179-8e9ae8e5-4db5-47ee-9ca7-3b9864af9b82.png)
#### &nbsp;&nbsp;&nbsp;② Javascript(jQuery) 활용한 비밀번호 보기/숨기기<br>
  ![image](https://user-images.githubusercontent.com/104151569/193989198-96255742-cb42-43fe-9d4d-0cacabd23408.png)

#### &nbsp;(3) 주민번호<br>
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사 및 성별 자동 선택<br>
  ![image](https://user-images.githubusercontent.com/104151569/193989791-e949221e-384c-4cf3-bfc1-a257d34a805f.png)
  ![image](https://user-images.githubusercontent.com/104151569/193990723-5ff55986-baee-4c8e-af77-4ecd344da56e.png)
  ![image](https://user-images.githubusercontent.com/104151569/193990595-30dfdb50-f34a-48ee-af3e-119c687f3d03.png)

#### &nbsp;(3) 이메일<br>
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193990266-0e083ce3-213e-4b2c-8c29-020885930aa4.png)
#### &nbsp;&nbsp;&nbsp;② Ajax, JDBC 활용한 ID 중복 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193990255-4d3e93b0-cc3b-4373-bab1-a2e13147c2a5.png)
#### &nbsp;&nbsp;&nbsp;③ JavaMail API 활용한 이메일 인증<br>
  ![image](https://user-images.githubusercontent.com/104151569/193990332-03c82bdf-3311-4a70-a88b-7b173e9927cb.png)

#### &nbsp;(4) 휴대폰<br>
#### &nbsp;&nbsp;&nbsp;① Ajax, JDBC 활용한 ID 중복 검사<br>
  ![image](https://user-images.githubusercontent.com/104151569/193991052-80958922-bb24-4f24-aa74-b3deef17b124.png)
  ![image](https://user-images.githubusercontent.com/104151569/193991175-45bcf743-5098-47ab-b75d-e731c34070d7.png)

#### &nbsp;(5) 우편번호<br>
#### &nbsp;&nbsp;&nbsp;① 다음 우편번호 API 활용한 우편번호, 주소 검색<br>
  ![image](https://user-images.githubusercontent.com/104151569/193991403-1127f8f8-68ff-48d8-b22a-e4755e199baf.png)


<br><br>
### 2. 마이페이지<br>
### 2-1. 주문내역
#### &nbsp;&nbsp;&nbsp;① JSTL core 라이브러리, fmt 라이브러리 활용한 날짜별 금액 산정<br>
#### &nbsp;&nbsp;&nbsp;② JDBC join 쿼리 활용한 데이터 조회<br>
  ![image](https://user-images.githubusercontent.com/104151569/193992649-3fee230f-6897-4561-b456-4dec7d3c0501.png)

<br><br>
### 2-2. 장바구니
#### &nbsp;&nbsp;&nbsp;① JSTL core 라이브러리, fmt 라이브러리 활용한 조건부 무료배송 및 금액 산정<br>
#### &nbsp;&nbsp;&nbsp;② Ajax, JDBC 활용한 상품 수량 변경 및 삭제<br>  
  ![image](https://user-images.githubusercontent.com/104151569/193993451-b4bc5691-f77b-44d1-977d-21b587ea3a9a.png)
  ![image](https://user-images.githubusercontent.com/104151569/193996936-9825ab75-d30f-4ce5-82f6-6ba83279aad8.png)
#### &nbsp;&nbsp;&nbsp;③ Ajax, JDBC 활용한 상품 중복 검사 및 추가<br>    
  ![image](https://user-images.githubusercontent.com/104151569/194000595-7a182899-aae2-4ec5-a91b-1a8e21609b14.png)
  ![image](https://user-images.githubusercontent.com/104151569/194000736-345fa585-2ef7-4ae8-a5d6-d5764ef702e0.png)


<br><br>
### 2-3. 찜한상품
#### &nbsp;&nbsp;&nbsp;① Ajax, JDBC 활용한 상품 중복 검사 및 삭제<br>  
  ![image](https://user-images.githubusercontent.com/104151569/193995736-56c074d6-83e9-41a0-9727-0f3ad8d0f2c8.png)
#### &nbsp;&nbsp;&nbsp;② Ajax, JDBC 활용한 상품 중복 검사 및 추가<br>  
  ![image](https://user-images.githubusercontent.com/104151569/194000866-878222c8-17fc-4971-9840-f3fae9f0cbc0.png)
  ![image](https://user-images.githubusercontent.com/104151569/194000880-68a3dae5-8630-4223-ab94-d94e2d741326.png)


<br><br>
### 2-4. 게시판
#### &nbsp;&nbsp;&nbsp;① 게시판 페이징 처리<br>
  ![image](https://user-images.githubusercontent.com/104151569/193997066-62925298-f81c-4c50-9e83-baf4eb90bf9b.png)
#### &nbsp;&nbsp;&nbsp;② JSTL core 라이브러리, 모달 활용한 답변 여부 구현<br>
  ![image](https://user-images.githubusercontent.com/104151569/193999007-75a1ea44-5cae-432d-b08d-8043c908362d.png)
#### &nbsp;&nbsp;&nbsp;③ Javascript(jQuery), Ajax, JDBC 활용한 답변 여부에 따른 삭제<br>  
  ![image](https://user-images.githubusercontent.com/104151569/193997477-eb3390a5-6f60-4c24-b580-f50f7b77120c.png)
  ![image](https://user-images.githubusercontent.com/104151569/193997570-6b2aa74c-1bd8-471d-bd7e-a3491dd8d12d.png)

<br><br>
### 2-5. 개인정보 수정
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery), JDBC 활용한 비밀번호 확인<br>  
  ![image](https://user-images.githubusercontent.com/104151569/193998137-c15d6169-8965-40aa-b847-51b5af4f8d91.png)
  ![image](https://user-images.githubusercontent.com/104151569/193998743-1bb71b4c-cc25-4b94-aef0-49f9a49ed838.png)
#### &nbsp;(1) 비밀번호, 비밀번호 확인<br>
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
#### &nbsp;&nbsp;&nbsp;② Javascript(jQuery) 활용한 비밀번호 보기/숨기기<br>

#### &nbsp;(2) 이메일<br>
#### &nbsp;&nbsp;&nbsp;① Javascript(jQuery) 정규표현식 활용한 형식 검사<br>
#### &nbsp;&nbsp;&nbsp;② Ajax, JDBC 활용한 ID 중복 검사<br>
#### &nbsp;&nbsp;&nbsp;③ JavaMail API 활용한 이메일 인증<br>

#### &nbsp;(3) 휴대폰<br>
#### &nbsp;&nbsp;&nbsp;① Ajax, JDBC 활용한 ID 중복 검사<br>

#### &nbsp;(4) 우편번호<br>
#### &nbsp;&nbsp;&nbsp;① 다음 우편번호 API 활용한 우편번호, 주소 검색<br>






