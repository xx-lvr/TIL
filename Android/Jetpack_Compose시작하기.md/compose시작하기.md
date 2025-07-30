#### Jetpack Compose 기초 | Android Developers에 대해서 정리
### 구성 가능한 함수
구성 가능한 함수는 ```@Composable```이라는 주석이 달린 일반 함수.\
 이렇게 하면 함수가 내부에서 다른 ```@Composable```함수를 호출할 수 있다. ```Greeting``` 함수를 ```@Composable```로 어떻게 표시하는지 확인할 수 있다.\
  이 함수는 지정된 입력(```String```)을 표시하는 UI 계층 구조를 생성합니다. ```Text```는 라이브러리에서 제공하는 구성 가능한 함수입니다.
```kotlin
@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}
```
참고: 구성 가능한 함수는 위의 코드 스니펫에서 확인할 수 있듯이 @Composable 주석으로 표시된 Kotlin 함수입니다.

### Android 앱의 Compose
Compose를 사용하면 Activity가 Android 앱의 진입점으로 유지된다.\
 setContent를 사용하여 레이아웃을 정의하지만, 기존 뷰 시스템에서 하던 것처럼 XML 파일을 사용하는 대신 이 함수에서 구성 가능한 함수를 호출한다.
 ```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            BasicsCodelabTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                  modifier = Modifier.fillMaxSize(),
                  color = MaterialTheme.colorScheme.background
                ) {
                    Greeting("Android")
                }
            }
        }
    }
}
```
+ ```BasicsCodelabTheme```은 구성 가능한 함수의 스타일을 지정하는 방법