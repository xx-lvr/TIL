## GSON
Google에서 제공하는 오픈소스 라이브러리로, 웹 상에서 데이터를 주고받을 때 자주 사용되는 경량 데이터 포맷이다.\
JSON 데이터를 우리가 사용하는 프로그래밍 언어의 객체로 변환(직렬화 Serialization) 하거나 반대로 객체를 JSON 형태로 변환해야 할 때도 있습니다.(역직렬화 Deserialization) 그때 Gson 라이브러리를 사용하 이러한 작업을 매우 간단하게 해준다.

## GSON 사용이유
+ 코드의 간결성
일반적으로 JSON을 객체로, 또는 객체를 JSON으로 변환하는 작업은 복잡할 수 있다. 그러나 Gson을 사용하면 한 줄의 코드만으로 이러한 변환 작업을 수행할 수 있다. 이로 인해 개발자는 복잡한 변환 로직을 작성할 필요 없이, 필요한 작업에 집중할 수 있다.
+ 성능 효율성
Gson은 내부적으로 최적화된 알고리즘을 사용하여 직렬화 및 역직렬화 작업을 빠르게 수행한한다. 그렇기 때문에 대규모의 데이터나 복잡한 구조의 객체도 효과적으로 처리할 수 있다.
+ 광범위한 커뮤니티 지원 및 잘 정리된 문서
Gson은 Google에서 개발되어 오랜 시간 동안 많은 개발자들에게 사용되어 왔다. 따라서 문제 해결 또는 활용 방안에 관한 다양한 정보와 예제가 인터넷 상에 널려 있다. 또한 공식 문서도 매우 잘 정리되어 있어, 필요한 정보를 쉽게 찾아볼 수 있다.

## GSON 기본 사용법
+ Kotlin 객체를 JSON으로 변환
```kotlin
val gson = Gson()
val jsonString = gson.toJson(someObject)
```
+ JSON을 Kotlin 객체로 변환
```
val myClassInstance: MyClass = gson.fromJson(jsonString, MyClass::class.java)
```