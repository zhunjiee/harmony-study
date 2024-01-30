@Entry
@Component
struct RelativeContainerPage {
  @State message: string = 'Hello World'

  build() {
    Navigation() {
      Row() {
        RelativeContainer() {
          Row() {
            Image($r('app.media.icon'))
          }
          .width(100)
          .height(100)
          .backgroundColor(Color.Yellow)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center },
          })
          .id('rowCenter')

          Row()
            .width(100)
            .height(100)
            .backgroundColor(Color.Red)
            .alignRules({
              bottom: { anchor: 'rowCenter', align: VerticalAlign.Top },
              right: { anchor: 'rowCenter', align: HorizontalAlign.Start },
            })
            .id('row1')

          Row()
            .width(100)
            .height(100)
            .backgroundColor(Color.Orange)
            .alignRules({
              bottom: { anchor: 'rowCenter', align: VerticalAlign.Top },
              left: { anchor: 'rowCenter', align: HorizontalAlign.End },
            })
            .id('row2')

          Row()
            .width(100)
            .height(100)
            .backgroundColor(Color.Gray)
            .alignRules({
              top: { anchor: 'rowCenter', align: VerticalAlign.Bottom },
              right: { anchor: 'rowCenter', align: HorizontalAlign.Start },
            })
            .id('row3')

          Row()
            .width(100)
            .height(100)
            .backgroundColor(Color.Green)
            .alignRules({
              top: { anchor: 'rowCenter', align: VerticalAlign.Bottom },
              left: { anchor: 'rowCenter', align: HorizontalAlign.End },
            })
            .id('row4')
        }
        .width(300).height(300)
        .border({ width: 2, color: Color.Blue })
      }
      .width('100%').height('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .title('RelativeContainer')
    .titleMode(NavigationTitleMode.Mini)
  }
}