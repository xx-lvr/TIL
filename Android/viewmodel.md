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

## ViewModel 사용법
```kotlin
import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class MyViewModel : ViewModel() {
    private val _count = MutableStateFlow(0) // 상태를 유지하는 변수
    val count: StateFlow<Int> = _count

    fun increment() {
        _count.value += 1
    }
}
```
+ 기본적인 `ViewModel` 정의
```kotlin
@Composable
fun CounterScreen(viewModel: MyViewModel = viewModel()) {
    val count by viewModel.count.collectAsState()

    Column {
        Text("카운트: $count")
        Button(onClick = { viewModel.increment() }) {
            Text("증가")
        }
    }
}
```
+ Jetpack Composable에서는 ViewModel() 함수를 사용하여 ViewModel 적용 가능

## ViewModelScope
ViewModelScope는 ViewModel의 생명주기를 자동으로 관리해주는 코루틴 스코프이다.

## ViewModelScope 사용 이유
+ 자동 관리: ViewModelScope에서 실행되는 모든 코루틴은 ViewModel의 생명주기와 연결되어 있기 때문에, ViewModel이 파괴될 때 자동으로 취소된다.
+ 비동기 작업 처리: 네트워크 요청, 데이터베이스 작업 등 비동기 작업을 쉽게 처리할 수 있다.
+ UI와 로직 분리: UI와 관련된 데이터를 비동기 작업에서 처리하는 로직을 ViewModel 내에서 처리함으로써 UI 코드와 로직을 분리할 수 있다.
```kotlin
class MyViewModel : ViewModel() {

    private val repository = DataRepository()

    // 데이터를 비동기적으로 가져오는 함수
    fun fetchData() {
        // viewModelScope 내에서 launch를 사용하여 비동기 작업 실행
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val data = repository.getData()  // 네트워크 요청 혹은 DB 작업
                // UI에 전달할 수 있도록 메인 스레드로 전환
                _dataState.value = data
            } catch (e: Exception) {
                // 오류 처리
                _errorState.value = e.message
            }
        }
    }
}
```