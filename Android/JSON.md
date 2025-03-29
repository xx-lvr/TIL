## JSON
json은 JavaScript Object Notation의 약자로 데이터를 구조적으로 표현하기 위한 일종의 포맷(Format)으로 네트워크를 통해 데이터를 주고받을 때 사용되는 경량의 데이터 형식을 의미한다.
```kotlin
{ "Movies" : [
    {
        "title" : "미션임파서블",
        "grade" : "15세 관람가",
        "category" : "액션"
    },
    {
        "title" : "어벤져스",
        "grade" : "12세 관람가",
        "category" : "액션"
    },
    {
        "title" : "범죄도시",
        "grade" : "19세 관람가",
        "category" : "범죄/스릴러"
    },
    {
        "title" : "",
        "grade" : "",
        "category" : ""
    }
]
} 
```
+ json은 위와같은 모습이다.

안드로이드에서 json파일 추가 하려면 파일을 만들고
```kotlin
private String getJsonString()
    {
        String json = "";

        try {
            InputStream is = getAssets().open("Movies.json");
            int fileSize = is.available();

            byte[] buffer = new byte[fileSize];
            is.read(buffer);
            is.close();

            json = new String(buffer, "UTF-8");
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }

        return json;
    }
```
이렇게 파일을 읽어오고
```kotlin
public class Movie{
    private String title;
    private String Category;
    private String grade;

    public String getTitle() {
        return title;
    }

    public String getCategory() {
        return Category;
    }

    public String getGrade() {
        return grade;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCategory(String category) {
        Category = category;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

}
```