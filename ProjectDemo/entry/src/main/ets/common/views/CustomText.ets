/**
 * Author:HouGe
 * Date:2023/9/25
 * Describe: 自定义文字组件
 */

import Logger from '../utils/Logger'

@Component
export default struct CustomTextWidget {
  private content: string = ""

  build() {
    Text(this.content).blackTextStyle()

  }
}

/// 全局扩展
@Extend(Text) function blackTextStyle(fontSize: number = 14, fontWeight: FontWeight = FontWeight.Normal) {
  .fontSize(fontSize).fontWeight(fontWeight).fontColor($r("app.color.common_black"))
}