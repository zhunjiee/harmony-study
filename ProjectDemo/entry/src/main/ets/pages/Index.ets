import router from '@ohos.router';
import { HomePage } from './home/HomePage';
import { CategoryPage } from './category/CategoryPage';
import { StorePage } from './store/StorePage';
import { MinePage } from './mine/MinePage';

@Entry
@Component
struct Index {
  private tabsController: TabsController = new TabsController();
  @State currentIndex: number = 0;

  // private  deviceWidth: number = getContext().getResourceManager().getDeviceCapability().width;
  // private deviceHeight: number = getContext().getResourceManager().getDeviceCapability().height;

  /// 自定义底部导航栏按钮
  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
        .margin({top: 5})
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({barPosition: BarPosition.End, controller: this.tabsController}) {
      TabContent() {
        HomePage()
      }
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.bottom_nav_home_icon_sel'), $r('app.media.bottom_nav_home_icon_nor')))

      TabContent() {
        CategoryPage()
      }
      .tabBar(this.TabBuilder('分类', 1, $r('app.media.bottom_nav_category_icon_sel'), $r('app.media.bottom_nav_category_icon_nor')))

      TabContent() {
        StorePage()
      }
      .tabBar(this.TabBuilder('商圈', 2, $r('app.media.bottom_nav_shangquan_icon_sel'), $r('app.media.bottom_nav_shangquan_icon_nor')))

      TabContent() {
        MinePage()
      }
      .tabBar(this.TabBuilder('我的', 3, $r('app.media.bottom_nav_mine_icon_sel'), $r('app.media.bottom_nav_mine_icon_nor')))
    }
    .scrollable(false)  // 禁止滚动
    .barMode(BarMode.Fixed)
    .onChange((index) => {
      this.currentIndex = index
    })
  }
}