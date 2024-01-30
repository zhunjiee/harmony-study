import AbilityStage from '@ohos.app.ability.AbilityStage';
import { Log } from '@app/log';

export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    // 应用的HAP在首次加载的时，为该Module初始化操作
    Log.init({
      tag: "HarmonyOSLog",
      domain: 0x0000,
      close: false,
      isHilog: true,
      showLogLocation: true,
      logSize: 800
    });
  }
}