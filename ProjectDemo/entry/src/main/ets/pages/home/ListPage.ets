import CustomNavigation from '../../views/CustomNavigation';
import GoodsDataSource from '../../viewmodel/GoodsDataSource';
import { initTabBarData } from '../../viewmodel/IniticalGoodsData';
import { Log } from '@app/log';
import { GoodsListItemType } from '../../viewmodel/IniticalGoodsData';
import display from '@ohos.display';
import CommonColor from '../../common/constants/CommonColor';

@Entry
@Component
struct ListPage {
  @State screenWidth: number = display.getDefaultDisplaySync().width;
  @State screenHeight: number = display.getDefaultDisplaySync().height;
  private dataSource: GoodsDataSource = new GoodsDataSource();

  aboutToAppear() {
    Log.info(`screenWidth = ${this.screenWidth}, screenHeight = ${this.screenHeight}`);
  }

  build() {
    Column() {
      CustomNavigation({ title: '商城' })
      TabBar().layoutWeight(1)  // 占满剩余空间
    }
    .width('100%')
  }
}

@Component
struct TabBar {
  build() {
    Tabs() {
      TabContent() {
        GoodsList()
      }.tabBar('精选')

      ForEach(initTabBarData, (item, index) => {
        TabContent() {
          Column() {
            Text(`${index}: ${item}`).fontSize(50).fontColor(Color.Red).fontWeight(FontWeight.Bold)
          }.alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
        }.tabBar(item)
      })
    }
  }
}

@Component
struct GoodsList {
  @Provide goodsListData: GoodsDataSource = new GoodsDataSource();

  aboutToAppear() {
    Log.info(`goodsListData.count === ${this.goodsListData.totalCount()}`);
  }

  /// 列表分组的头部组件
  @Builder itemHead(text: string) {
    Row(){
      Text(text).fontSize(12).margin({left: 15, right: 15})
    }.height(15)
  }

  build() {
    Row() {
      List({ space: 16 }) {
        ListItemGroup({header: this.itemHead('A')}) {
          LazyForEach(this.goodsListData, (item: GoodsListItemType) => {
            ListItem() {
              Row() {
                Column() {
                  Image(item.goodsImg)
                    .width(100)
                    .height(100)
                }
                .justifyContent(FlexAlign.Center)
                .height('100%')
                .margin({ right: 10 })

                Column() {
                  Column() {
                    Text(item.goodsName).fontSize(16).fontWeight(FontWeight.Medium).margin({ bottom: 10 })
                    Text(item.advertising_language).fontSize(12).fontColor(Color.Gray)
                  }
                  .alignItems(HorizontalAlign.Start)

                  Row() {
                    Text(item.evaluate).fontSize(12)
                    Text(item.price).fontSize(16).fontColor(Color.Red)
                  }
                  .justifyContent(FlexAlign.SpaceBetween)
                  .width('100%')
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1) // 让其占满剩余空间
                .height('100%')

              }
              .width('100%')
              .height(100)

            }
            .backgroundColor(Color.White)
            .margin({left: 15, right: 15})
            .padding(10)
            .borderRadius(5)
            .onTouch((event: TouchEvent) => {
              switch (event.type) {
                case TouchType.Down:
                  break;

                case TouchType.Up:
                  break;

                case TouchType.Move:
                  break;
              }
            })
          })
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(CommonColor.BACKGROUND_COLOR)
      .scrollBar(BarState.Auto) // 滚动条
      .cachedCount(5) // 缓存个数
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }
}