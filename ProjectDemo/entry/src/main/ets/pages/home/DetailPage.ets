import CustomNavigation from '../../views/CustomNavigation';

@Entry
@Component
struct DetailPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      CustomNavigation({title: '详情'})

      Column() {
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
          .border({width: 5, color: Color.Red})
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .margin({top: 15})
        }
        .padding(20)
        .backgroundColor(Color.Blue)
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Yellow)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}