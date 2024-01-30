import {Log} from '@app/log';
import Logger from '../../common/utils/Logger';

@Builder
export function GlobalBuilder(options:{param1: string}) {

}

@Entry
@Component
struct BuilderParamPage {

  @Builder componentBuilder0() {
    Text('aBuilder0').fontSize(50).fontWeight(FontWeight.Bold).fontColor(Color.Red)
  }

  @Builder componentBuilder1(content: string) : void {
    Text(content).fontSize(50).fontWeight(FontWeight.Bold).fontColor(Color.Green)
  }

  build() {
    Row() {
      Column() {
        Child({ aBuilder0: this.componentBuilder0, aBuilder1: this.componentBuilder1 })
        Text('aBuilder2').fontSize(50).fontWeight(FontWeight.Bold).fontColor(Color.Orange)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  @BuilderParam aBuilder0: () => void;
  @BuilderParam aBuilder1: (string) => void;

  build() {
    Column() {
      this.aBuilder0()
      this.aBuilder1('aBuilder1')
    }
  }
}