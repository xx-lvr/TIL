## flex
flex는 CSS에서 Flexbox 레이아웃 모델을 사용할 때, 각 Flex 아이템에 대해 크기와 공간 분배를 정의하는 중요한 속성이다.
+ Flex(플렉스)는 Flexible Box, Flexbox라고 부르기도 합니다.

## flex 속성
+ 컨테이너에 적용하는 속성
+ 아이템에 적용하는 속성

## flex 컨테이너에 적용하는 속성
###  display: flex 
Flex 컨테이너에 display: flex;를 적용하는게 시작
```
.container {
	display: flex;
	/* display: inline-flex; */
}
```
###  inline-flex
이건 block과 inline-block의 관계를 생각하면 된다.
아이템의 배치와 관련이 있다기 보다는 컨테이너가 주변 요소들과 어떻게 어우러질지 결정하는 값이다.
+ 아이템의 배치된 방향의 축 메인축(Main Axis)
+ 메인축과 수직인 축을 수직축 또는 교차축 (Cross Axis)

###  flex-direction - 배치 방향 설정
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

 ###  flex-wrap - 줄넘김 처리 설정
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

### flex-flow
flex-direction과 flex-wrap을 한꺼번에 지정할 수 있는 단축 속성
```
.container {
	flex-flow: row wrap;
	/* 아래의 두 줄을 줄여 쓴 것 */
	/* flex-direction: row; */
	/* flex-wrap: wrap; */
}
```
### justify-content (메인축 방향으로 정렬)
 메인축 방향으로 아이템을들 정렬하는 속성
 ```
 .container {
	justify-content: flex-start;
	/* justify-content: flex-end; */
	/* justify-content: center; */
	/* justify-content: space-between; */
	/* justify-content: space-around; */
	/* justify-content: space-evenly; */
}
```
+ flex-start (기본값) :
아이템들을 시작점으로 정렬합니다.
flex-direction이 row(가로 배치)일 때는 왼쪽, column(세로 배치)일 때는 위
+ flex-end: 
아이템들을 끝점으로 정렬합니다.
flex-direction이 row(가로 배치)일 때는 오른쪽, column(세로 배치)일 때는 아래
+ center: 
아이템들을 가운데로 정렬
+ space-between: 
아이템들의 “사이(between)”에 균일한 간격을 만들어 준다.
+ space-around
아이템들의 “둘레(around)”에 균일한 간격을 만들어 준다.
+ space-evenly
아이템들의 사이와 양 끝에 균일한 간격을 만들어 줍니다.
주의! IE와 엣지(Edge)에서는 지원되지 않습니다👎

### align=items (수직축 방향 정렬)
수직축 방향으로 아이템을들 정렬하는 속성
```
.container {
	align-items: stretch;
	/* align-items: flex-start; */
	/* align-items: flex-end; */
	/* align-items: center; */
	/* align-items: baseline; */
}
```
+ stretch (기본값) : 
아이템들이 수직축 방향으로 끝까지 쭈욱 늘어난다.
+ flex-start : 
아이템들을 시작점으로 정렬.
flex-direction이 row(가로 배치)일 때는 위, column(세로 배치)일 때는 왼쪽이다.
+ flex-end :
아이템들을 끝으로 정렬.
flex-direction이 row(가로 배치)일 때는 아래, column(세로 배치)일 때는 오른쪽이다.
+ center : 
아이템들을 가운데로 정렬
+ baseline : 
아이템들을 텍스트 베이스라인 기준으로 정렬
### align-content (여러 행 정렬)
flex-wrap: wrap;이 설정된 상태에서, 아이템들의 행이 2줄 이상 되었을 때의 수직축 방향 정렬을 결정하는 속성입니다.
```
.container {
	flex-wrap: wrap;
	align-content: stretch;
	/* align-content: flex-start; */
	/* align-content: flex-end; */
	/* align-content: center; */
	/* align-content: space-between; */
	/* align-content: space-around; */
	/* align-content: space-evenly; */
}
```
+ 역시나 space-evenly는 MS 계열 브라우저(IE, 엣지)에서는 지원되지 않습니다👎

## Flex 아이템에 적용하는 속성들
### flex-basis (유연한 박스의 기본 영역)
flex-basis는 Flex 아이템의 기본 크기를 설정합니다(flex-direction이 row일 때는 너비, column일 때는 높이).\
flex-basis의 값으로는 우리가 width, height 등에 사용하는 각종 단위의 수가 들어갈 수 있다.
```
.item {
	flex-basis: 100px;
	width: 100px;
}
```

### flex-grow(유연하게 늘리기)
flex-grow는 아이템이 flex-basis의 값보다 커질 수 있는지를 결정하는 속성!\
flex-grow에는 숫자값이 들어가는데, 몇이든 일단 0보다 큰 값이 세팅이 되면 해당 아이템이 유연한(Flexible) 박스로 변하고 원래의 크기보다 커지며 빈 공간을 메우게 된다.\
기본값이 0이기 때문에, 따로 적용하기 전까지는 아이템이 늘어나지 않았던 거예요.
```
.item {
	flex-grow: 1;
	// flex-grow: 0; // 기본값
}
```