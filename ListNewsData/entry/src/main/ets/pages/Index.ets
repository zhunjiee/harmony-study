import Logger from '../common/utils/Logger';
import { PullToRefresh } from '@ohos/pulltorefresh';

@Entry
@Component
struct Index {
  private dataNumbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  private dataStrings: string[] = ['我的评论', '与我相关', '个人中心1', '个人中心2', '个人中心3', '我的发布', '设置', '退出登录'];
  @State data: string[] = this.dataStrings;
  // 需绑定列表或宫格组件
  private scroller: Scroller = new Scroller();

  build() {
    Row() {
      Column() {
        PullToRefresh({
          data: $data,
          scroller: this.scroller,
          customList: () => {
            this.getListView();
          },
          onRefresh:() => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                resolve('刷新成功');
                this.data = this.dataNumbers;
              }, 2000);
            });
          },
          onLoadMore: () => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                resolve('加载更多成功');
                this.data.push('增加的条目' + this.data.length);
              }, 2000);
            });
          },
          customRefresh: null,
          customLoad: null
        })
      }
      .width('100%')
    }
    .height('100%')
  }

  @Builder
  private getListView() {
    List({ space: 20, scroller: this.scroller }) {
      ForEach(this.data, (item: string) => {
        ListItem() {
          Text(item)
            .width('100%')
            .height(150)
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .backgroundColor('#95efd2')
        }
      })
    }
    .backgroundColor('#eeeeee')
    .divider({ strokeWidth: 1, color: 0x222222 })
    .edgeEffect(EdgeEffect.None) // 必须设置列表为滑动到边缘无效果
  }

  onPageShow() {
    Logger.debug('onPageShow');
  }

  onPageHide() {
    Logger.debug('onPageHide');
  }

  onBackPress() {
    Logger.debug('onBackPress');
  }

  aboutToAppear() {
    Logger.debug('aboutToAppear');
  }

  aboutToDisappear() {
    Logger.debug('aboutToDisappear');
  }
}