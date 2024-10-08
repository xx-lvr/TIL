# css
CSS (Cascading Style Sheets)는 웹페이지를 꾸미려고 작성하는 코드
# CSS의 rulset 해부
전체 구조는 ```rule set```라 불립니다 (하지만 종종 줄여서 "rule"이라고도 한다). 각 부분의 이름에도 주목!
![alt text](image.png)
+ ```선택자(selector)``` :
rule set의 맨 앞에 있는 HTML 요소 이름. 이것은 꾸밀 요소(들)을 선택, (이 예에서는 p 요소). 다른 요소를 꾸미기 위해서는 선택자만 바꾸기.

+ ```선언``` :
color: red와 같은 단일 규칙; 우리가 꾸미기 원하는 요소의 속성을 명시한다.

+ ```속성(property)``` :
주어진 HTML 요소를 꾸밀 수 있는 방법. (이 예에서, color는 p 요소의 속성이다.) CSS에서, rule 내에서 영향을 줄 속성을 선택한다.

```속성 값``` :
속성의 오른쪽에, 콜론 뒤에, 주어진 속성을 위한 많은 가능한 결과중 하나를 선택하기 위해 속성 값을 갖는다 (color 의 값에는 red 외에 많은 것이 있다).

## 주목!✊
+ 각각의 rule set (셀렉터로 구분) 은 반드시 ({}) 로 감싸져야 한다.
+ 각각의 선언 안에, 각 속성을 해당 값과 구분하기 위해 콜론 (:)을 사용해야만 한다.
+ 각각의 rule set 안에, 각 선언을 그 다음 선언으로부터 구분하기 위해 세미콜론 (;)을 사용해야만 한다.