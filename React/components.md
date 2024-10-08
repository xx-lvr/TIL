# Compenets
+ 재사용 가능한 **UI 부품**
+ Components라는 부품을 모아 하나의 화면을 만듦\
 -> 기존 html의 비효율적인 중복되는 코드를 줄여줌!
 + 쉽게 말하면, **HTML, CSS들의 집합**

## Components는 Javascript 함수다.
+ 어떤 경우에 함수를 만들까?
+ **특정 역할**을 수행하게 하려고(features, pages...)
+ **재사용** 되는 로직을 **모듈화**해서 반복 작업을 줄이려고 (좁은 범위의 components)
## 함수형 컴포넌트와 클래스 컴포넌트 
함수형 컴포넌트 ->  가장 간단한 유형의 React 컴포넌트\
클래스 컴포넌트 ->  더 복잡하고 더 많은 기능을 제공, React.Component를 확장한 클래스로 선언되며, render 메서드를 포함해야 합니다

## 클래스 컴포넌트에서 생명주기(Lifecycle)
+ React의 각 클래스 컴포넌트에는 특정 시점에서 코드를 실행할 수 있는 여러 생명주기 메서드가 있다. 
+ 생명주기는 크게 마운팅(Mounting), 업데이트(Updating), 언마운팅(Unmounting) 단계로 나눌 수 있습니다.

### 마운팅(Mounting)
+ **```constructor()```**: 컴포넌트가 처음 생성될 때 호출되며, 초기 state를 설정하거나 props를 사용할 수 있다.
+ **```static getDerivedStateFromProps(props, state)```**: 컴포넌트가 마운트되거나 업데이트되기 전에 호출되며, 주어진 props로부터 state를 업데이트할 수 있다. 주로 props에 따라 state를 업데이트하는 데 사용된다.
+ **```render()```**: 컴포넌트가 화면에 렌더링될 JSX를 반환하는 메서드입니다. React는 이 메서드를 통해 DOM을 업데이트합니다.
+ **```componentDidMount()```**: 컴포넌트가 처음 DOM에 삽입된 직후에 호출됩니다. 여기서는 API 호출 등 초기화 작업을 수행할 수 있다.
###  업데이트(Updating)
**```static getDerivedStateFromProps(props, state)```**: 마운팅 때와 마찬가지로, 업데이트 시에도 호출되어 props의 변화를 state에 반영할 수 있다.
**```shouldComponentUpdate(nextProps, nextState)```**: 새로운 props나 state가 컴포넌트에 전달되었을 때, 리렌더링을 할지 말지를 결정하는 메서드이다. true를 반환하면 리렌더링하고, false를 반환하면 리렌더링을 방지한다.\
**```render()```**: 업데이트 후에 다시 호출되어 화면을 재렌더링한다.\
**```getSnapshotBeforeUpdate(prevProps, prevState)```**: DOM이 업데이트되기 직전에 호출되며, 현재 DOM 상태를 기반으로 일부 값을 캡처할 수 있습니다. 이 값은 componentDidUpdate()로 전달된다.\
**```componentDidUpdate(prevProps, prevState, snapshot)```**: 업데이트가 완료된 후 호출됩니다. 이 메서드에서 DOM 조작이나 네트워크 요청 등의 후처리를 수행할 수 있다.
### 언마운팅(Unmounting)
**```componentWillUnmount()```**: 컴포넌트가 DOM에서 제거되기 직전에 호출된다. 이 메서드에서 타이머 제거, 네트워크 요청 취소 등 정리 작업을 할 수 있다.
### 추가 설명👍
**```getDerivedStateFromProps```** 는 최신 React에서 추가된 메서드로, 이전에는 componentWillReceiveProps()가 비슷한 역할을 했지만, 더 이상 사용되지 않는다.
**```getSnapshotBeforeUpdate```** 는 매우 구체적인 상황에서 DOM 변화를 감지하고 처리하는 용도로 사용된다.
**```componentDidMount```** 와 **```componentDidUpdate```** 는 데이터 요청이나 이벤트 리스너 등록과 같은 비동기 작업을 처리할 때 유용하다.

### 최근
최신 React에서는 ```componentWillReceiveProps, componentWillMount, componentWillUpdate``` 같은 메서드들이 더 이상 사용되지 않거나 경고를 표시하니, 그 대신 ```getDerivedStateFromProps```와 같은 최신 메서드를 사용하는 것이 좋다.