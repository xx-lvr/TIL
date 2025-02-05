## ViewModel
**ViewModel 클래스** 는 비즈니스 로직 또는 화면 수준 상태 홀더입니다. UI에 상태를 노출하고 관련 비즈니스 로직을 캡슐화한다. 
+ 주요 이점은 상태를 캐시하여 구성 변경에도 이를 유지한다는 것

## ViewModel의 이점
ViewModel 클래스의 주요 이점은 기본적으로 두 가지이다.
+ UI 상태를 유지할 수 있다.

+ 비즈니스 로직에 대한 액세스 권한을 제공한다.
- 참고 : ViewModel은 Compose는 물론 Hilt, Navigation과 같은 주요 Jetpack 라이브러리와의 통합을 완전히 지원한다.

### 지속성
ViewModel은 ViewModel이 보유하는 상태와 ViewModel이 트리거하는 작업에서 모두 지속성을 허용한다.
+ 이러한 캐싱을 통해 화면 회전과 같은 일반적인 구성 변경에도 데이터를 다시 가져올 필요가 없다.

## ViewModel은 굉장히 중요하다!