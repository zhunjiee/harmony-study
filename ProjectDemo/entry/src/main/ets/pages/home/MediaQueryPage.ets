import mediaquery from '@ohos.mediaquery';
import CustomNavigation from '../../views/CustomNavigation';
import window from '@ohos.window';
import media from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import { Log } from '@app/log/src/main/ets/Log';

let portraitFunc = null;

@Entry
@Component
struct MediaQueryPage {
  @State color: string = '#DB7093';
  @State text: string = 'Portrait';

  // 当设备横屏时条件成立
  listener = mediaquery.matchMediaSync('(orientation: landscape)');

  // 当满足媒体查询条件时，触发回调
  onPortrait(mediaQueryResult) {
    if (mediaQueryResult.matches) {
      this.color = '#FFD700';
      this.text = 'Landscape';
    } else {
      this.color = '#DB7093';
      this.text = 'Portrait';
    }
  }

  aboutToAppear() {
    // 绑定当前应用实例
    portraitFunc = this.onPortrait.bind(this);
    // 绑定回调函数
    this.listener.on('change', portraitFunc);
  }

  // 改变设备横竖屏状态函数
  private changeOrientation(isLandscape: boolean) {
    // 获取UIAbility实例的上下文信息
    let context = getContext(this) as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT);
    });
  }

  build() {
    Row() {
      Column() {
        CustomNavigation({
          title: 'mediaquery',
          showMenuBtn: true,
          menuIcon: $r('app.media.common_add_icon'),
          menuAction: () => {
            Log.info('点击添加按钮');
          }
        })
        Text(this.text).fontSize(50).fontColor(this.color)
        Text('Landscape').fontSize(50).fontColor(this.color).backgroundColor(Color.Orange)
          .onClick(() => {
            this.changeOrientation(true);
          })
        Text('Portrait').fontSize(50).fontColor(this.color).backgroundColor(Color.Red)
          .onClick(() => {
            this.changeOrientation(false);
          })
      }
      .width('100%').height('100%')
    }
    .height('100%')
  }
}