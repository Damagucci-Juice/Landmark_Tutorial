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

