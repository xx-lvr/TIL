## Jetpack Compose 페이즈
 ![alt text](<image/compose stable.png>)
**Jetpack Compose는 이 단계로 화면에 실행된다.**
## Composition(구성)
이 단계는 ```Composable``` 함수의 설명을 생성하고 메모리를 슬롯에 할당하는 과정으로 시작. 여기서 생성된 슬롯들은 각 Composable 함수를 메모이즈하여(memoize) 런타임 동안 효율적인 호출 및 실행을 가능하게 한다.
## Layout(레이아웃)
이 단계는 ```Composable``` 트리 내에서 각 ```Composable``` 노드의 위치가 설정된다. 레이아웃 단계는 주로 ```Composable``` 노드의 측정 및 적절한 배치를 포함하며, UI의 전체 구조 내에서 모든 요소가 정확하게 배치

## Drawing(그리기)
이 단계는 ```Composable``` 노드가 일반적인 화면에 렌더링된다. ```Composable``` 함수들에 대한 정보를 사용하여 사용자 상호작용이 가능하도록 시각적 표현을 생성하는 단계

##
내부 메커니즘은 더 복잡하지만 ```Composable 함수```를 작성할 때는 이런 단계를 거쳐 화면에 나타남
## Recomposition
 이미 렌더링이 끝난 Composabla 함수의 크기 및 색상과 같은 UI 요소를 수정한다고 가정을 해본다. 그러면 **Drawing(그리기)** 단계가 완료 되었으니, ```Compose```는 새로운 업데이트를 적용하기 위해서 첫 번째 단계인 **Composition(구성)** 부터 다시 실행해야 한다. 이 과정을 통틀어서 **Recomposition(재구성)** 이라고 한다.

## 안정성 이해하기 (Understanding Stability)
```Compose 컴파일러```는 ```Composable 함수의 매개변수```를 **안정(stable)** 과 **불안정(unstable)** 두 가지 상태로 분류한다.
매개변수의 안정성 분류는 Compose 런타임에 의해 Composable 함수가 recomposition을 거쳐야 하는지 등의 여부를 결정하는 데 사용한다.

## Stable vs UnStable
```Compose 컴파일러```는 ```Composable 함수```에서 ```사용되는 매개변수```의 유형을 검사하고 아래의 기준에 따라 안정성 여부를 분류한다

+ String을 포함한 기본 유형(Primitive)은 안정적이다
+ ```(Int) -> String```과 같은 람다 표현식으로 표현된 함수 유형은 안정적인 것으로 간주된다.
+ 모든 ```public property```가 불변이고 (value로 정의된 경우) stable한 속성을 가진 클래스
+ ```@Stable```, ```@Immutable```과 같은 ```stability``` 어노테이션을 사용하여 명시적으로 표기된 클래스는 안정적인 것으로 간주된다.

##
```kotlin
data class User(
  val id: Int,
  val name: String,
)
```
안정적으로 간주되는 ```primitive``` 타입과 불변인 ```value```로 정의된 ``` public property``` 만을 가지는 ```User``` 데이터 클래스는 ```Compose``` 컴파일러에 의해 안정적인 것으로 간주된다.

하지만 ```Compose``` 컴파일러는 ```Composable``` 함수 내의 매개변수 유형을 추론하여 아래와 같은 기준에 따라서 불안정한 것으로 간주한다.
+ ```Kotlin의 collections```에서 제공하는 ```List, Map``` 등을 포함한 모든 인터페이스와 ```Any``` 타입과 같은 추상 클래스는 컴파일 시 구현을 예측할 수 없기, 때문에 불안정한 것으로 간주된다.
+ 하나 이상의 가변적이거나 본질적으로 불안정한 ```public property```를 포함하는 클래스는 불안정한 것으로 분류된다.

```kotlin
data class User(
  val id: Int,
  var name: String,
)
```
여기서 User 데이터 클래스가 ```stable```로 간주되는 primitive 타입으로 구성되어 있음에도 불구하고, 가변적인 ```name``` property가 존재하기 때문에 ```Compose 컴파일러```는 이를 불안정한 것으로 간주한다.

## Smart Recomposition(스마트 Recomposition)
클래스의 안정성이 결정되고 ```Compose 런타임```은```smart recomposition이```라고 알려진 내부 메커니즘을 통해 recomposition을 시작한다. ```smart recomposition```은 제공된 안정성 정보를 활용하여 불필요한 ```recomposition```을 선택적으로 건너뛰어 ```Compose```의 전체 성능을 향상시킨다.
+ **안정성에 따른 결정**: 매개변수가 안정적이고 그 값이 변경되지 않은 경우(```equals()가 true를 반환```), Compose는 관련 UI 컴포넌트의 ````recomposition````을 건너뛴다. 매개변수가 불안정하거나, 안정적이지만 그 값이 변경된 경우(```equals()가 false를 반환```), 런타임은 ````recomposition````을 시작하여 UI 레이아웃을 ```무효화(invalidate)```하고 다시 그린다.
+ **동등성 검사**: ```equals()```함수를 통한 동등성 비교는 해당 타입이 안정적으로 간주되는 경우에만 수행한다. 새로운 입력값이 ```Composable 함수```에 전달될 때마다, 항상 해당 타입의 ```equals() 메서드```를 사용하여 이전 값과 비교한한다.

## Composable 함수 추론하기
```Compose 컴파일러```는 ```Kotlin Compiler 플러그인```으로 구축되어 있어, 개발자가 작성한 소스 코드를 컴파일 시 분석할 수 있다. 또한, ```Composable 함수```의 고유한 특성에 더 잘 맞도록 개발자가 작성한 원본 소스 코드를 조정할 수 있다.

```컴파일러는 Composable 함수```들을 **Restartable, Skippable, Moveable, Replaceable** 등 여러 그룹으로 분류하여 실행을 최적화합니다

## Restartable(재실행 가능한)
**Restartable**은 ```Compose 컴파일러```에 의해 추론된 ```Composable 함수의 유형```\
```Compose 런타임```이 입력의 변화를 감지하면, 이 새로운 입력을 반영하기 위해 함수를 다시 시작(또는 재호출)한다.

특정한 어노테이션으로``` Composable 함수```를 명시적으로 주석 처리하지 않아도, 대부분의 함수는 기본적으로 ```restartable```로 간주된다. 이는 입력이나 상태가 변경될 때마다 Compose 런타임이 ```Composable 함수```에 대해```recomposition```을 트리거할 수 있다는 것을 의미한다