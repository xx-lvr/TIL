## Trie
+ 일반 트리 자료구조 중 하나
+ 문자열을 key로 사용하는 동적인 Set 또는 연관 배열을 저장하는 트리의 확장된 자료 구조.
+ Digital Tree, Radix Tree, Prefix Tree라고도 불린다.
+ 텍스트 자동 완성 기능과 같이 문자열을 저장하고 탐색하는데 유용한 자료 구조이다.
## Trie 자료구조 형태
+ 각 노드는 <Key, Value> 맵을 가지고 있다.
+ Key는 하나의 알파벳이 되고, Value는 그 `Key`에 해당하는 자식 노드가 된다.
+ 다음은 `DEV, DEAR, PIE, POP, POW`라는 단어가 들어있는 Trie 자료구조를 도식화한 것이다. 휴대폰 전화번호부에서 검색을 하거나 사전에서 단어를 찾는 것과 같다.
+ 예를 들어, 아래 그림에서 'DEV'라는 문자열을 찾으려면 루트 노드에서부터 순차적으로 `[D] -> [E] -> [V]` 를 탐색한다.

##
+ 루트 노드는 특정 문자를 의미하지 않고 자식 노드만 가지고 있다.
+ '부모 노드'나 '자신이 어떤 알파벳에 해당하는 노드' 인지를 가지고 있지 않다. = value가 어떤 key를 가졌는지 상관하지 않는다.
+ Key가 D인 자식도 P인 자식도 있다.
+ 루트 노드를 제외한 노드의 자손들은 해당 노드와 공통 접두어를 가진다는 특징이 있다.
## 특징
+ 정렬된 트리 구조이다. (데이터에 따라 이진트리도 된다)
+ Trie는 자식 노드를 `Map<Key,Value>` 형태로 가지고 있다.
+ 루트 노드를 제외한 노드의 자손들은 해당 노드와 공통 접두어를 가진다.
+ 루트 노드는 빈 문자와 연관있다.(특정 문자가 할당되어있지 않다.)
## 사용 목적
+ 단순하게 하나씩 문자열 탐색을 하는 것보다 훨씬 효율적이다.
+ 빠른 탐색이 장점이지만 각 노드에서 자식들에 대한 포인터들을 배열로 모두 저장하고 있다는 점에서 저장공간의 크기가 크다는 단점도 있다.
+ 검색어 자동완성, 사전에서 찾기, 문자열 검사 같은 부분에 쓰일 수 있다.