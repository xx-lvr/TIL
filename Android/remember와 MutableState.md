기본적으로 Compose에서 어떠한 상태 값이 바뀌게 되면 재구성(Recomposition)이 일어나게 된다.\
재구성이 되었을 때도 값을 저장할 수 있도록 하기 위하여 Compose에서는 remember 키워드를 제공한다.

```kotlin
val a = remember { mutableStateOf(false) }
var b by remember { mutableStateOf("a") }
val (c, d) = remember { mutableStateOf("") }
```
이와 같이 3가지 방법으로 remember을 선언하여 사용한다.

MutableState 클래스는 Compose에 의해 읽기와 쓰기를 관찰하는 단일 값 보유자입니다.