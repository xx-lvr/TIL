## runCatching
runCatching은 Kotlin 1.3 표준 라이브러리에 추가된 효과적인 ```inline function```이다.

자바에서 ```try-catch```를 통해 예외가 발생할 것으로 예상되는 부분을 try 블록으로 감싸고 catch 블록에는 예외 발생 시 처리할 로직들을 넣는 전통적인 예외처리법을 사용함. 이 방법은 코틀린에서도 사용할 수 있고 현재도 자주 쓰이지만 코틀린은 다른 예외처리 방법을 제공하는데  그게 ```runCatching```이다.

## 예제
```kotlin
fun main() {
    val input = "123"
    val result = runCatching { input.toInt() }
        .onSuccess { value -> println("변환 성공 : $value") }
        .onFailure { exception -> println("변환 실패 : $exception") }
    println(result)
}

// >> 변환 성공 : 123
// >> Success(123)
```
```kotlin
inline fun <R> runCatching(block: () -> R): Result<R>
```

## 장점

+ ```try-catch``` 보다 간결한 형태로 예외처리 코드를 쓸 수 있어 상대적으로 가독성이 좋다
+ ```onSuccess```, ```onFailure```, ```getOrElse``` 등의 함수를 연달아 쓸 수 있는 함수 체이닝이 가능

## 단점
+ ```Result 타입```을 사용해 성공 / 실패를 리턴하기 때문에 try-catch보다 상대적으로 성능 저하가 일어날 수 있다