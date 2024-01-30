/**
 * Author:HouGe
 * Date:2023/9/25
 * Describe: 自定义弹窗
 */
import Constants from '../../common/constants/Constants';
import Logger from '../../common/utils/Logger';
import Context from '@ohos.app.ability.common';
import CommonUtils from '../../common/utils/CommonUtils';

export default class CustomDialog {
  /**
   * Alert dialog dialog
   */
  alertDialog(context: Context.UIAbilityContext) {
    AlertDialog.show({
      message: $r('app.string.alert_dialog_message'),
      alignment: DialogAlignment.Bottom,
      offset: {
        dx: 0,
        dy: Constants.DY_OFFSET
      },
      primaryButton: {
        value: $r('app.string.cancel_title'),
        action: () => {
          Logger.info(Constants.TAG_COMMON_UTILS, 'Callback cancel button is clicked');
        }
      },
      secondaryButton: {
        value: $r('app.string.confirm_title'),
        action: () => {
          // Exiting the app.
          context.terminateSelf();
          Logger.info(Constants.TAG_COMMON_UTILS, 'Callback definite button is clicked');
        }
      }
    });
  }


  /**
   * Date dialog dialog
   */
  datePickerDialog(dateCallback) {
    DatePickerDialog.show({
      start: new Date(Constants.START_TIME),
      end: new Date(),
      selected: new Date(Constants.SELECT_TIME),
      lunar: false,
      onAccept: (value: DatePickerResult) => {
        let year = value.year;
        let month = value.month + Constants.PLUS_ONE;
        let day = value.day;
        let birthdate: string = this.getBirthDateValue(year, month, day);
        dateCallback(birthdate);
      }
    });
  }

  /**
   * Text dialog dialog
   */
  textPickerDialog(sexArray: Resource, sexCallback) {
    if (CommonUtils.isEmptyArr(sexArray)) {
      Logger.error(Constants.TAG_COMMON_UTILS, 'sex is null');
      return;
    }
    TextPickerDialog.show({
      range: sexArray,
      selected: 0,
      onAccept: (result: TextPickerResult) => {
        sexCallback(result.value);
      },
      onCancel: () => {
        Logger.info(Constants.TAG_COMMON_UTILS, 'TextPickerDialog onCancel');
      }
    });
  }

  /**
   * Get default birth date
   *
   * @param {number} year year
   * @param {number} month month
   * @param {number} day day
   * @returns {string} return birth date
   */
  getBirthDateValue(year: number, month: number, day: number): string {
    let birthdate: string = `${year}${Constants.DATE_YEAR}${month}` +
    `${Constants.DATE_MONTH}${day}${Constants.DATE_DAY}`;
    return birthdate;
  }
}