## Stateful vs Stateless
+ Stateful: Composable 함수는 ```remember``` 함수를 활용할 때 stateful로 간주된다. 이 접근 방식을 사용하면 함수가 객체를 메모리에 저장하여 여러 recomposition에서 상태를 효과적으로 보존할 수 있습니다. ```remember```함수는 Composable 함수가 반복적으로 호출되더라도 상태가 일관되도록 한다.
+ Stateless: Composable 함수는 ```remember```함수를 사용하지 않고 대신 인수를 통해 상태를 수신할 때 stateless라고 부른다. 이 시나리오는 함수 내부 상태를 유지하지 않고 전달된 데이터에 의존하므로 특정 시나리오에서 더 예측 가능하고 재사용하기 쉽다.

Stateful과 Stateless Composable 함수 중에서 선택하는 것은 특정 요구 사항에 따라 달라지지만 일반적으로는 Stateless한 Composable함수를 만드는 것이 좋다.

#### 왜 Stateless한 Composable함수를 만드는 것이 좋을까?
-> 그것은 **유지 관리성**과 **재사용성** 때문이다.
+ 유지관리성(Maintainability): Stateful한 Composable는 호출자 입장에서 사용하기 편리해 보일 수 있지만, 내부 상태와 동작에 대한 이해를 흐리게 만들 수 있다.
+ 재사용성(Reusability): 외부 상태 관리에 의존하는 Stateless Composable 함수는 다양한 애플리케이션 부분에서 더 재사용 가능한 경향이 있다. 입력에 따라 출력을 예측할 수 있는 순수 함수처럼 작동한다.

## 요약
Stateless Composable 함수를 선택한다면 구성요소를 다양한 맥락에서 테스트, 유지관리 및 재사용하기 쉬운 더 깔끔하고 모듈화된 코드로 이어질 수 있다.

Stateful Composable 함수를 Stateless 함수로 변환하는 것이 상태 호이스팅(State Hoisting)이라는 기술을 통해 효과적으로 달성 가능 하다.