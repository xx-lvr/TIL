## Navigation
**네비게이션**은 **화면 이동과 관련된 액션을 쉽게 구현**하도록 도와주는 ```Jetpack``` 라이브러리 중 하나이다.

기존 ```Fragment```간 전환 코드를 작성할 때는 ```Fragment Manager```를 활용할 때가 많았지만 ```Fragment``` 백스택에 대한 관리, 전달할 파라미터 등 많은 요소를 직접 코드로 구현 해줘야 해서 **컴포넌트의 코드 양이 길고 난잡해지는 경우가 많아짐**

이랬는데 ```Jetpack Navigation```이 등장해서 화면이동, 스택 관리, 데이터 전송 등 쉽게 구현 할 수 있게 해줘서 많이 사용한다.

## Navigation의 장점
+ ```Fragment``` 트랜잭션 처리
+ **손쉬운 화면 이동** 처리
+ 손쉬운 **애니메이션 구현** 지원
+ **딥링크 구현** 및 처리 지원
+ ```Safe args``` **와 함께 안전한 데이터 전달** 지원
+ ```Bottom Navigation```, ```Navigation Drawer``` 와 같은 요소들을 손쉽게 구현할 수 있도록 지원
+ ```ViewModel``` 을 이용, 그래프 내의 컴포넌트 간에 UI 관련 데이터를 공유할 수 있도록 지원 등 장점이 많다.

## Navigation의 구성 요소
1. **Navigation Graph**
 + ```Navigation```과 관련해 **모든 정보를 가지고 있는 구성 요소**\
  어떤 목적지들이 있는지, 이동 중 어떤 액션을 취할 것인지, 어떤 데이터를 넘겨줄 것인지에 대한 정보가 담겨져 있다.
+ ```XML```
2. **NavHost**
+ ```Navigation Graph``` 에 담겨져 있는 목적지, **즉 화면을 표현하는** 빈 컨테이너 공간
```kotlin
findNavController().navigate(action)
```
3. **NavController**
+ 모든 ```NavHost```가 개별적으로 가지고 있는 구성요소\
이름에 맞게 NavHost 에 어떤 화면을 띄울 것인지 컨트롤하는 역할을 수행