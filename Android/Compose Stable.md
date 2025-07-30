## Jetpack Compose 페이즈
 ![alt text](<image/compose stable.png>)
**Jetpack Compose는 이 단계로 화면에 실행된다.**
## Composition(구성)
이 단계는 ```Composable``` 함수의 설명을 생성하고 메모리를 슬롯에 할당하는 과정으로 시작. 여기서 생성된 슬롯들은 각 Composable 함수를 메모이즈하여(memoize) 런타임 동안 효율적인 호출 및 실행을 가능하게 한다.
## Layout(레이아웃)
이 단계는 ```Composable``` 트리 내에서 각 ```Composable``` 노드의 위치가 설정된다. 레이아웃 단계는 주로 ```Composable``` 노드의 측정 및 적절한 배치를 포함하며, UI의 전체 구조 내에서 모든 요소가 정확하게 배치

## Drawing(그리기)
이 단계는 ```Composable``` 노드가 일반적인 화면에 렌더링된다. ```Composable``` 함수들에 대한 정보를 사용하여 사용자 상호작용이 가능하도록 시각적 표현을 생성하는 단계

### 1. Stability 이해하기

Composable 함수의 매개변수 안정성은 Recomposition을 유발하는 중요한 요소이다.

*   **Stable:** 매개변수가 변경되지 않았을 때 Recomposition을 건너뛸 수 있다.
*   **Unstable:** 매개변수가 변경되었을 때 Recomposition이 발생한다.

**Stable vs. Unstable 기준:**

**Stable:**

*   `String`, `Int` 등 기본 타입(Primitive)
*   `(Int) -> String`과 같은 람다 표현식 (단, unstable한 값을 캡처하지 않는 경우)
*   모든 public property가 불변(`val`)이고 stable한 속성을 가진 클래스
*   `@Stable`, `@Immutable` 어노테이션이 적용된 클래스

**Unstable:**

*   `List`, `Map` 등 Kotlin Collections 인터페이스, `Any` 타입과 같은 추상 클래스
*   하나 이상의 가변적인 public property(`var`)를 포함하는 클래스

**예시:**

```kotlin
// Stable (val, primitive 타입)
data class User(
    val id: Int,
    val name: String,
)

// Unstable (var)
data class User(
    val id: Int,
    var name: String,
)
```
### 2. 스마트 Recomposition (Smart Recomposition)
Compose 런타임은 매개변수의 안정성 정보를 활용하여 불필요한 Recomposition을 건너뛰는 스마트 Recomposition 메커니즘을 사용한한다.

+ 매개변수가 Stable하고 값이 변경되지 않았다면, Recomposition을 건너뛴다.

+ 매개변수가 Unstable하거나, Stable하지만 값이 변경되었다면, Recomposition을 시작한다.

+ 값의 동등성 비교는 equals() 함수를 통해 이루어지며, 타입이 Stable로 간주될 때만 수행한다.

### 3. Composable 함수 추론하기
Compose 컴파일러는 Composable 함수를 Restartable, Skippable 등으로 분류하여 실행을 최적화한다.

+ Restartable: 입력 변화를 감지하면 함수를 다시 시작(재호출)한다. 대부분의 Composable 함수는 기본적으로 Restartable이다.

+ Skippable: 특정 조건 하에서 Recomposition 프로세스를 완전히 건너뛸 수 있다. 함수 호출 구조의 최상위(root) Composable 함수의 성능 향상에 중요하다.

+ Composable 함수는 동시에 Restartable이면서 Skippable일 수 있다.

### 4. 컴포즈 컴파일러 메트릭 (Compose Compiler Metrics)
Compose Compiler 플러그인을 사용하면 Compose 코드의 상세 보고서와 메트릭을 생성하여 개선점을 파악하고 코드 동작을 이해할 수 있다.

**설정 (build.gradle.kts)**
```kotlin
subprojects {
    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().all {
        kotlinOptions.freeCompilerArgs += listOf(
            "-P",
            "plugin:androidx.compose.compiler.plugins.kotlin:reportsDestination=" +
                    project.buildDir.absolutePath + "/compose_metrics"
        )
        kotlinOptions.freeCompilerArgs += listOf(
            "-P",
            "plugin:androidx.compose.compiler.plugins.kotlin:metricsDestination=" +
                    project.buildDir.absolutePath + "/compose_metrics"
        )
    }
}
```
생성되는 파일:
```
module.json: Skippable, Restartable Composable 함수 수 등 고수준 메트릭 제공.

composables.txt: 각 Composable 함수의 시그니처와 매개변수 안정성 정보 제공 (Skippable 여부 분석에 사용).

classes.txt: 클래스의 안정성 추론 결과 제공 (Stable, Unstable, Runtime).
```

### 5. 안정성 어노테이션 (Stability Annotations)
Unstable한 클래스를 Stable한 클래스로 변환하는 데 사용되는 어노테이션:

**@Immutable**: 클래스의 모든 public property가 초기 생성 후 변경되지 않음을 보장 (불변).

+ 모든 public property는 val로 선언.

+ 커스텀 setter 피하기.

+ public property의 타입이 불변인지 확인 (kotlin.collections 사용 주의).

**@Stable**: public property는 불변이지만 클래스 자체는 변경 가능할 수 있습니다. 동일한 입력에 대해 항상 동일한 결과를 반환해야 합니다.

State 인터페이스 (value는 불변, MutableState를 통해 수정 가능)

#### Immutable vs. Stable:

+ ```@Immutable```: 데이터 클래스 등 불변 객체에 사용.

+ ```@Stable```: 인터페이스 등 내부적으로 변경 가능한 상태를 가질 수 있는 객체에 사용.

```@NonRestartableComposable```

Composable 함수가 호출 매개변수 변경으로 인한 recomposition 프로세스 중에 자동으로 다시 시작되지 않아야 함을 알린다. 주로 사이드 이펙트와 관련된 시나리오에서 효율성을 높이기 위해 사용한다.```LaunchedEffect```가 대표적인 예시이다.

### 6. Composable 함수 안정화 (Stabilize Composable Functions)
성능 향상을 위해 Composable 함수를 Skippable하게 만드는 전략:

1. **Immutable Collections**: kotlinx.collections.immutable 라이브러리 또는 Guava의 Immutable Collections 사용.

2. **Lambda**:

+ 값을 캡처하지 않는 람다는 싱글톤으로 취급되어 Stable.

+ 외부 변수를 캡처하는 람다는 remember 함수를 사용하여 캡슐화 (캡처된 값이 변경될 때마다 람다 재호출).

+ Any 타입을 매개변수로 받는 Composable 함수의 람다가 unstable한 값을 캡처하는 경우 remember로 람다식을 감싸 안정적인 것으로 만들어 Recomposition을 생략할 수 있도록 해야 한다.

```kotlin
val fetchData = remember(name) { { myViewModel.fetchData(name = name) } } // 중괄호는 오타가 아니다.

MyComposable {
  fetchData.invoke()
}
```
3. **Wrapper Class**: 제어할 수 없는 Unstable 클래스에 대한 Wrapper 클래스 생성.
```kotlin
@Immutable
data class ImmutableUserList(
   val user: List<User>
)

@Composable
fun UserAvatars(
    modifier: Modifier,
    userList: ImmutableUserList,
)
```
4. **Stability Configuration File**: Compose 컴파일러 버전 1.5.5부터 compose_compiler_config.conf 파일에 Stable로 간주하고 싶은 클래스/인터페이스 패키지 정의.

**build.gradle.kts:**
```kotlin
kotlinOptions {
  freeCompilerArgs += listOf(
      "-P",
      "plugin:androidx.compose.compiler.plugins.kotlin:stabilityConfigurationPath=" +
      "${project.absolutePath}/compose_compiler_config.conf"
  )
}
```
**compose_compiler_config.conf:**
```kotlin
// Consider LocalDateTime stable
java.time.LocalDateTime
// Consider kotlin collections stable
kotlin.collections.*
// Consider my datalayer and all submodules stable
com.datalayer.**
// Consider my generic type stable based off it's first type parameter only
com.example.GenericClass<*,_>
```
### 7. 멀티 모듈 아키텍처에서의 안정성 (Stability In Multi-Module Architecture)
모듈화된 프로젝트에서 독립된 모듈의 클래스는 Unstable한 것으로 간주될 수 있습니다. 해결 방법:

+ 데이터 모듈에 compose-runtime 라이브러리 추가하고, 데이터 클래스에 안정성 주석 추가. (이상적이지 않은 경우 존재)

+ **Compose Stable Marker**: compose-runtime에 의존하지 않고 @Immutable, @Stable 어노테이션을 제공하는 경량 라이브러리.

+ **Stability Configuration File:** Configuration 파일에 다른 모듈의 클래스를 나열하여 Stable하게 인식되도록 설정.

### Small Talk
1. **모든 Composable 함수는 Skippable이 되어야 하는가?** No. 성능 최적화 전략은 여러가지 방법 중 하나일 뿐이며 강박적으로 Skippable하게 만들 필요는 없다.

2. **Recomposition을 잘 이해하는 것이 중요한가?** Yes. 선언형 UI 패러다임의 장점과 더불어 Stability와 UI 업데이트에 대한 고민을 해결해야 합니다. 의도치 않은 상황에서의 Recomposition과 UI hierarchy의 root node에서 발생한 Recomposition이 최하위 node까지 전이되는 것을 이해하고 대처해야 한다.