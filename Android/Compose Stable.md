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

