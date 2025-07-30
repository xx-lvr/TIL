## UIstate
**UI State(UI 상태)**는 Android 앱에서 화면에 표시되는 데이터와 UI의 현재 상태를 의미한한다.
예를 들어, 화면에 보이는 텍스트, 버튼의 활성화/비활성화 상태, 로딩 중인지 여부, 에러 메시지 등이 모두 UI State에 포함된된다.

## UIstate 핵심 개념
+ 일관성 유지: 사용자 인터페이스가 예측 가능하게 동작하도록 한한다.

+ 재사용성: 같은 데이터를 여러 곳에서 공유할 수 있다.

+ 테스트 용이성: 상태를 분리하면 UI 로직을 쉽게 테스트할 수 있다.

+ 생명주기 관리: 화면 회전이나 앱 백그라운드 전환 시 데이터를 안전하게 유지한다.

## 상태 유형
**로컬 상태**,  단일 컴포넌트 전용, `TextField` 입력값
**공유 상태**,  여러 화면에서 공유, 사용자 프로필 데이터
**영구 상태**,  앱 종료 후 유지, SharedPreferences 

## 예제
### 2. 상태 관리 도구
```kotlin
// Jetpack Compose 예제
var count by remember { mutableStateOf(0) }  // 관찰 가능한 상태
```
```kotlin
// ViewModel + StateFlow 예제
private val _state = MutableStateFlow(0)
val state = _state.asStateFlow()  // 상태 업데이트 자동 반영
```