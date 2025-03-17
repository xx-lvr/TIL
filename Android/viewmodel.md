## ViewModel
**ViewModel**은 Android에서 UI 관련 데이터를 관리하는 아키텍처 컴포넌트이다.

## ViewModel의 이점
ViewModel 클래스의 주요 이점은 기본적으로 두 가지이다.
+ 구성 변경에도 데이터 유지: 화면 회전 등의 변경이 발생해도 기존 데이터를 유지할 수 있다.
+ UI와 로직 분리: UI 관련 데이터를 ViewModel에서 관리하여 Composable이 깔끔해진다.
+ 비동기 작업과 연동 용이: viewModelScope를 활용하여 네트워크 요청이나 데이터베이스 작업을 쉽게 관리할 수 있다.
- 참고 : ViewModel은 Compose는 물론 Hilt, Navigation과 같은 주요 Jetpack 라이브러리와의 통합을 완전히 지원한다.

### 지속성
ViewModel은 ViewModel이 보유하는 상태와 ViewModel이 트리거하는 작업에서 모두 지속성을 허용한다.
+ 이러한 캐싱을 통해 화면 회전과 같은 일반적인 구성 변경에도 데이터를 다시 가져올 필요가 없다.

## ViewModel은 굉장히 중요하다! 다시 공부해서 적어야겠다.