import router from '@ohos.router';
import Logger from '../../common/utils/Logger';
import Constants from '../../common/constants/Constants';
import MyDataSource from '../../viewmodel/MyDataSource';
import { Log } from '@app/log';
import { GlobalBuilder } from './BuilderParamPage';

const TAG: string = '[Example].[Entry].[HomePage]';

@Component
export struct HomePage {
  @State message: string = 'Home Page';
  private dataSource: MyDataSource = new MyDataSource();

  aboutToAppear() {
    this.dataSource.pushData('RelativeContainer');
    this.dataSource.pushData('Stack');
    this.dataSource.pushData('GridRow/GridCol');
    this.dataSource.pushData('MediaQuery');
    this.dataSource.pushData('List');

    Logger.info(TAG, 'Home page is about to appear');
    Logger.info(Constants.TAG_HOME, 'Home page is about to appear');
    Log.error("Log 三方库 打印测试");
  }

  build() {
    Column() {
      Navigation() {
        Text(this.message)
          .fontSize(50)
          .fontColor(Color.Pink)
          .fontWeight(FontWeight.Bold)

        Button("跳转到详情页")
          .onClick(() => {
            router.pushUrl({ url: 'pages/home/DetailPage' })
          })
          .margin({ bottom: 20 })

        List({ space: 10 }) {
          LazyForEach(this.dataSource,
            (item: string, index?: number) => {
              ListItem() {
                Text(`${index + 1}: ${item}`)
                  .fontSize(20)
                  .fontColor(Color.Black)
                  .fontWeight(FontWeight.Bold)
              }
              .width('100%')
              .height(80)
              .backgroundColor(Color.White)
              .align(Alignment.Start)
              .borderRadius(10)
              .padding({ left: 10, right: 10 })
              .onClick(() => {
                if (index == 0) {
                  router.pushUrl({ url: 'pages/home/RelativeContainerPage' })
                } else if (index == 1) {
                  router.pushUrl({ url: 'pages/home/StackPage' })
                } else if (index == 2) {
                  router.pushUrl({ url: 'pages/home/GridRowPage' })
                } else if (index == 3) {
                  router.pushUrl({ url: 'pages/home/MediaQueryPage' })
                } else if (index == 4) {
                  router.pushUrl({ url: 'pages/home/ListPage' })
                }
              })
            },
            (item: string, index?: number) => item)
        }
        .padding({ left: 10, right: 10 })
        .cachedCount(5)

      }
      .title('首页')
      .hideBackButton(true)
      .menus([
        { value: '', icon: '../../../resources/base/media/common_delete_icon.png', action: () => {
        } },
        { value: '', icon: '../../../resources/base/media/common_add_icon.png', action: () => {
          router.pushUrl({ url: 'pages/home/DetailPage' })
        } },
      ])
      .toolBar({
        item: [
          { value: 'func', icon: '../../../resources/base/media/bottom_nav_scan_icon.png', action: () => {
          } },
          { value: 'func', icon: '../../../resources/base/media/bottom_nav_scan_icon.png', action: () => {
          } },
          { value: 'func', icon: '../../../resources/base/media/bottom_nav_scan_icon.png', action: () => {
          } },
        ]
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.common_background_color'))
  }
}