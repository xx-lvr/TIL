## flex
flex는 CSS에서 Flexbox 레이아웃 모델을 사용할 때, 각 Flex 아이템에 대해 크기와 공간 분배를 정의하는 중요한 속성이다.
+ Flex(플렉스)는 Flexible Box, Flexbox라고 부르기도 합니다.

## flex 속성
+ 컨테이너에 적용하는 속성
+ 아이템에 적용하는 속성

## flex 컨테이너에 적용하는 속성
### 1. display: flex 
Flex 컨테이너에 display: flex;를 적용하는게 시작
```
.container {
	display: flex;
	/* display: inline-flex; */
}
```
### 2. inline-flex
이건 block과 inline-block의 관계를 생각하면 된다.
아이템의 배치와 관련이 있다기 보다는 컨테이너가 주변 요소들과 어떻게 어우러질지 결정하는 값이다.
+ 아이템의 배치된 방향의 축 메인축(Main Axis)
+ 메인축과 수직인 축을 수직축 또는 교차축 (Cross Axis)

### 3. flex-direction - 배치 방향 설정
아이템들이 배치되는 축의 방향을 결정하는 속성
+  row(기본값)
 아이템들이 행(가로) 방향으로 배치
 + row-reverse
 아이템들이 역순으로 가로 배치
 + column
 아이템들이 열(세로) 방향으로 배치
 + column-reverse
 아이템들이 역순으로 세로 배치. 크기가 작은 모바일 기기에서 column으로 배치하다가 일정 폭 이상이 되면 row로 바꿔주는 식으로 반응형 레이아웃을 구현할 수도 있다.
 ```
 .container {
	flex-direction: row;
	/* flex-direction: column; */
	/* flex-direction: row-reverse; */
	/* flex-direction: column-reverse; */
}
```

 ### 4. flex-wrap - 줄넘김 처리 설정
 컨테이너가 더 이상 아이템들을 한 줄에 담을 여유 공간이 없을 때
아이템 줄바꿈을 어떻게 할지 결정하는 속성
```
.container {
	flex-wrap: nowrap;
	/* flex-wrap: wrap; */
	/* flex-wrap: wrap-reverse; */
}
```
+ nowrap(기본값):
줄바꿈을 하지 않습니다. 넘치면 그냥 삐져 나간다.
+ wrap:
줄바꿈을 합니다. float이나 inline-block으로 배치한 요소들과 비슷하게 동작
+ wrap-reverse:
줄바꿈을 하는데, 아이템을 역순으로 배치
