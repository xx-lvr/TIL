## Jetpack Compose 페이즈
 ![alt text](<image/compose stable.png>)
**Jetpack Compose는 이 단계로 화면에 실행된다.**
## Composition(구성)
이 단계는 ```Composable``` 함수의 설명을 생성하고 메모리를 슬롯에 할당하는 과정으로 시작. 여기서 생성된 슬롯들은 각 Composable 함수를 메모이즈하여(memoize) 런타임 동안 효율적인 호출 및 실행을 가능하게 한다.
## Layout(레이아웃)
이 단계는 ```Composable``` 트리 내에서 각 ```Composable``` 노드의 위치가 설정된다. 레이아웃 단계는 주로 ```Composable``` 노드의 측정 및 적절한 배치를 포함하며, UI의 전체 구조 내에서 모든 요소가 정확하게 배치

## Drawing(그리기)
이 단계는 ```Composable``` 노드가 일반적인 화면에 렌더링된다. ```Composable``` 함수들에 대한 정보를 사용하여 사용자 상호작용이 가능하도록 시각적 표현을 생성하는 단계