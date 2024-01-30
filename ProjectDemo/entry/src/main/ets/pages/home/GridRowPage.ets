@Entry
@Component
struct GridRowPage {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  @State currentBp: string = 'unknown';

  build() {
    Navigation() {
      Column() {
        GridRow({
          breakpoints: {
            value: ['200vp', '300vp', '400vp', '5000vp', '600vp'],
            reference: BreakpointsReference.WindowSize
          }
        }) {
          ForEach(this.bgColors, (color, index) => {
            GridCol({
              span: {
                xs: 2,
                sm: 3,
                md: 4,
                lg: 6,
                xl: 8,
                xxl: 12
              }
            }) {
              Row() {
                Text(`${index + 1}`)
              }.width("100%").height('50vp')
            }.backgroundColor(color)
          })
        }
      }
      .width('100%')
    }
    .title('GridRow/GridCol')
    .titleMode(NavigationTitleMode.Mini)
  }
}