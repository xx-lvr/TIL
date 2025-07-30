## Math
 **수학 관련 작업을 수행하는 데 유용한 속성과 메서드를 제공**

## Math.abs
**숫자의 절대값을 반환하는 함수**
```javascript
Math.abs(-5);  // 5
Math.abs(10);  // 10
Math.abs(0);   // 0
```

## Math.max(x, y, ...)
**주어진 인수 중 가장 큰 숫자를 반환**
```javascript
Math.max(10, 20, 30);  // 30
Math.max(-1, 100, 50); // 100
```

## Math.min(x, y, ...)
**주어진 인수 중 가장 작은 숫자를 반환**
```javascript
Math.min(10, 20, 30);  // 10
Math.min(-1, 100, 50); // -1
```

## Math.pow(x, y)
**`x`에 `y`만큼의 제곱을 계산하는 함수. 기본적으로 `x`를 `y` 번 곱하는 연산을 수행**
```javascript
Math.pow(2, 3);  // 8 (2 * 2 * 2)
Math.pow(5, 2);  // 25 (5 * 5)
```

## Math.sqrt(x)

**숫자의 제곱근을 반환하는 함수 `x`의 제곱근을 계산하여 반환**
```javascript
Math.sqrt(16); // 4
Math.sqrt(9);  // 3
```
## Math.round(x)
**숫자를 반올림하여 가장 가까운 정수로 반환. `x`의 소수점 첫째 자리에서 반올림을 진행**
```javascript
Math.round(4.7);  // 5
Math.round(4.4);  // 4
```

## Math.floor(x)
**숫자를 내림하여 가장 가까운 정수로 반환. 소수점 이하를 모두 버리고, 더 작은 정수로 처리**
```javascript
Math.floor(4.9);  // 4
Math.floor(4.1);  // 4
```
## Math.ceil(x)

**숫자를 올림하여 가장 가까운 정수로 반환. 소수점 이하를 버리되, 항상 더 큰 정수로 처리**
```javascript
Math.ceil(4.1);  // 5
Math.ceil(4.9);  // 5
```
## Math.random()

**0 이상 1 미만의 난수를 반환하는 함수. 이 값은 고정되지 않고 호출할 때마다 달라진다.**
```javascript
Math.random(); // 0.3679 (예시, 매번 다른 값이 반환됩니다)
```

## Math.PI
**원주율 π 값을 나타내는 상수. 3.141592653589793으로 고정된 값이다.**
```javascript
Math.PI; // 3.141592653589793
```
## Math.trunc(x)

**소수점 이하를 제거하고 정수 부분만 반환. 반올림이나 내림이 아닌, 단순히 소수점 이하를 잘라낸다.**
```javascript
Math.trunc(4.9);  // 4
Math.trunc(-4.9); // -4
```

## Math.sign(x)
**Math.sign(x), x가 음수, null 또는 양수인지 반환**
```javascript
Math.sign(10);   // 1
Math.sign(-5);   // -1
Math.sign(0);    // 0
Math.sign(-0);   // -0
Math.sign(NaN);  // NaN
```