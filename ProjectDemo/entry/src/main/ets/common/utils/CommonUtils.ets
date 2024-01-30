import bundleManager from '@ohos.bundle.bundleManager';

export class CommonUtils {
  /*
   * 获取App的bundleName
   */
  async getBundleName(): Promise<string> {
    let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
    return bundleInfo.name;
  }

  /**
   * Check obj is empty
   *
   * @param {object} obj
   * @return {boolean} true(empty)
   */
  isEmpty(obj): boolean {
    return obj === undefined || obj === null || obj === '';
  }

  /**
   * Check array is empty
   *
   * @param {Array}array
   * @return {boolean} true(empty)
   */
  isEmptyArr(array): boolean {
    return this.isEmpty(array) || array.length === 0;
  }
}

export default new CommonUtils();