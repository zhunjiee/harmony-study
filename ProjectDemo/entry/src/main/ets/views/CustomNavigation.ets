import { Log } from '@app/log/src/main/ets/Log';
/**
 * Author:HouGe
 * Date:2023/9/23
 * Describe: 自定义顶部导航栏
 */
import router from '@ohos.router';
import CommonUtils from '../common/utils/CommonUtils';

@Component
export default struct CustomNavigation {
  // 主标题
  title: string = "";
  hideBackBtn: boolean = false;
  // 返回按钮
  backAction: (event?: ClickEvent) => void = () => router.back();
  // 右侧菜单按钮
  menuTitle: string = "";
  menuIcon: Resource;
  showMenuBtn: boolean = false;
  menuAction: (event?: ClickEvent) => void;
  // 样式
  heightValue: Length = 44;
  bgColor: Color = Color.White;
  paddingValue: number = 15;

aboutToAppear() {
  Log.info(`title type === ${typeof this.title}`);
}

  build() {
    Column() {
      Row() {
        Button({ type: ButtonType.Capsule }) {
          Image($r('app.media.nav_back_black')).width(20).height(20)
        }
        .backgroundColor(Color.Transparent)
        .padding(5)
        .opacity(this.hideBackBtn ? 0.0 : 1.0)
        .onClick(this.backAction);

        if (typeof this.title === 'string') {
          Text(this.title)
            .fontSize(18)
            .fontColor($r('app.color.common_black'))
            .fontWeight(FontWeight.Medium)
        }

        Button(this.menuTitle, { type: ButtonType.Capsule }) {
          Row() {
            if (!CommonUtils.isEmpty(this.menuTitle)) {
              Text(this.menuTitle).fontSize(14).fontColor($r('app.color.common_black'))
            }
            if(!CommonUtils.isEmpty(this.menuIcon)) {
              Image(this.menuIcon).width(20).height(20)
            }
          }
        }
          .backgroundColor(Color.Transparent)
          .padding(5)
          .opacity(this.showMenuBtn ? 1.0 : 0.0)
          .onClick(this.menuAction);
      }
      .height('100%')
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height(this.heightValue)
    .backgroundColor(this.bgColor)
    .padding({ left: this.paddingValue, right: this.paddingValue })
  }
}