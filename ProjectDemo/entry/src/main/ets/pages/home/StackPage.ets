@Entry
@Component
struct StackPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Navigation() {
        Stack({ alignContent: Alignment.Top }) {
          Rect()
            .width(320)
            .height(30)
            .stroke(Color.Red)
            .strokeWidth(5)
            .fill(Color.Yellow)

          Column() {
            Text(this.message)
              .fontSize(50)
              .fontColor(Color.Pink)
              .fontWeight(FontWeight.Bold)
          }
          .width(300)
          .height(200)
          .backgroundColor(Color.Green)
          .border({ width: 5, color: Color.Red })
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .margin({ top: 15 })

          Button('button').width(80).height(40).backgroundColor('#ff8ff3eb').fontColor('#000')
        }
        .padding(20)
        .backgroundColor(Color.Blue)
      }
      .title('Stack Demo')
      .titleMode(NavigationTitleMode.Mini)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}