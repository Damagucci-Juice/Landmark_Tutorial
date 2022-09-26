# Landmark_Tutorial
Swift UI Official Tutorial supplied by Apple.

## Tutorial 1.

![LandmarkDetail](https://user-images.githubusercontent.com/50472122/192096641-7e77bf11-12fd-4c4c-a129-f08120a0e00e.png)

- LandmarkDetail

- 공간을 구분하는 구분선 `Divider()`
- 상태바까지 넘는 뷰 표시 `.ignoreSafeArea(edges: .top)
- 뷰 안에 모델인 `landmark` 존재하여 뷰에 정보 뿌려줌

```swift
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

...

        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
```
- `.offset()` : 위로 130 만큼 들어간다. 
- `.padding(.bottom, _)` : 아래를 130만큼 당겨온다.
- navigation 관련 메서드는 밖에서 관련 설정이 되어있으면 런타임에 보여짐

- CircleImage

```swift
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
```
- `.clipShape(Circle())` : 사진의 프레임을 원형으로 제한
- `.overlay { }` :  테두리 라인
- `.shadow(radius:)` : 그림자 

---

## Tutorial 2.

![LandmarkList](https://user-images.githubusercontent.com/50472122/192097404-8fd2c7cf-04f7-4ca9-b5cb-f5ea71195e9e.png)

- UITableView 처럼 구성할 수 없을까? 
- Row 를 클릭하면 Detail 로 들어갈 순 없을까?
- Group과 List 의 차이?
- Simulator 미리 보기 -> PreviewDevice

### 줄과 줄의 집합
- 테이블뷰를 만들어주기 위해선 Cell 이라 불렸던 것처럼 Row 역할을 할 View가 필요- Row : HStackView 기반으로 줄을 구성
- List : Row의 묶음
- Row 를 클릭해서 Detail 뷰를 띄우기 위해선 전체를 NavigationView 로 감싸줘야함

```swift
    var body: some View {
        NavigationView {
            List(landmarks, id: \.id) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
```
- NavigationView { NavigationLink { (액션) } labeL: { (UI) } } 의 구조 
- List 선언하는것이 살짝 특이
    - List( 모델집합, id: \.id) { landmark in }
    - 모델집합의 ForEach 문 같다. 
    - `landmarks` 의 타입은 `[Landmark]` 이고 `identifiable` 프로토콜을 채택하여 id 값으로 이 타입을 식별한다.   

## Tutorial 3.

![Badges](https://user-images.githubusercontent.com/50472122/192254201-b0ff461b-a603-44bb-bb56-0221d11a2ea8.png)

bezier path 를 이용해서 그림을 그리는 것이 주요 미션이였는데, 
평소하고 그림 그리는 로직은 비슷하다. 

- 본격적으로 그림을 그리는 앱을 연습한다면 해볼만 하겠지만 일단은 넘어간다. 
- 뱃지 같은 경우도 그림을 그리기 보단 이미지를 다운로드 받아서 쓰는 경우가 더 많을 거같다. 

## Tutorial 4. 

https://user-images.githubusercontent.com/50472122/192254912-91a14f8f-a27e-4cd4-8a9d-aceb9f47a67e.mov

카테고리별로 횡 스크롤 뷰를 넣는 뷰

`CategoryHome` 을 보면 Tab 메뉴도 들어간 것이 보인다. List와 ForEach 를 사용해서 구성한 부분이 인상깊다. 

## Tutorial 5. 

https://user-images.githubusercontent.com/50472122/192257802-d27bb71a-cd4a-4706-a31e-8c036c321ad7.mov

- 오른쪽 위에 사람 모양을 클릭하면, Modal 뷰 처럼 뜨는데 이렇게 전환하는 modifier를 .sheet() 라고 한다. 
- 정보를 수정하기 위해서 `@Environment` 라는 것을 쓴다. 
- `@Environment(\.editMode) var editMode` : 값을 수정할 수 있다는 환경 설정 변수인것 같다. 
    - 특이하게 `editMode?.wrappedValue` 라는 것을 사용해서 active 인지, inactive 인지 확인한다. 
    - `EditButton()` 이란 것이 있는데, Edit 버튼을 대표하는 버튼 같다. 
- 편집을 하려고 들어가면, 가지고 있는 초안을 바탕으로 데이터를 쓰게 된다. 
- `@Binding` 으로 엮어주었기 때문에 변경된 값이 Profile 로 저장이된다. 
- 여러 Enum 중에 값을 선택하는 `Picker` 와 달력에서 날짜를 선택하는 `DatePicker` 가 아주 간편해 보인다. 


