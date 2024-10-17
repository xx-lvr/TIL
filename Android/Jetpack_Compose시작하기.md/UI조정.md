#### Jetpack Compose 기초 | Android Developers에 대해서 정리
### 4. UI 조정
먼저 Greeting에 다른 배경 색상을 설정 하려면 ```Text``` 컴포저블을 ```Surface```로 래핑하면 됩니다. ```Surface```는 색상을 사용하므로 ```MaterialTheme.colorScheme.primary```를 사용합니다.

**참고**: Surface 및 MaterialTheme은 Material Design과 관련된 개념이며, Material Design은 사용자 인터페이스와 환경을 만드는 데 도움을 주기 위해 Google에서 만든 디자인 시스템이다.
```kotlin
@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Surface(color = MaterialTheme.colorScheme.primary) {
        Text(
            text = "Hello $name!",
            modifier = modifier
        )
    }
}
```
+ ```Surface``` 내부에 중첩된 구성요소는 배경 색상 위에 그려진다.

### 수정자
```Surface``` 및 ```Text```와 같은 대부분의 Compose UI 요소는 ```modifier``` 매개변수를 선택적으로 허용한다.\
 수정자는 상위 요소 레이아웃 내에서 UI 요소가 배치되고 표시되고 동작하는 방식을 UI 요소에 알려준다.\
  ```Greeting``` 컴포저블에는 이미 기본 수정자가 있으며 이 기본 수정자는 ```Text```에 전달된다.

예를 들어, ```padding``` 수정자는 수정자가 데코레이션하는 요소 주변의 공간을 나타낸다. ```Modifier.padding()```으로 패딩 수정자를 만들 수 있다. 체이닝을 통해 여러 수정자를 추가할 수도 있으므로 여기서는 패딩 수정자를 기본 수정자 ```modifier.padding(24.dp)``` 
에 추가할 수 있다.\
이제 화면의 ```Text```에 패딩을 추가하는 아래 코드.
  ```kotlin
  import androidx.compose.foundation.layout.padding
import androidx.compose.ui.unit.dp
//  ...
@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Surface(color = MaterialTheme.colorScheme.primary) {
        Text(
            text = "Hello $name!",
            modifier = modifier.padding(24.dp)
        )
    }
}
  ```