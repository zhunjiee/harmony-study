/**
 * Author:HouGe
 * Date:2023/10/5
 * Describe:
 */
import BasicDataSource from '../common/utils/BasicDataSource';
import { GoodsListItemType, goodsInitialList } from './IniticalGoodsData';

// 创建数据
const createListRange = (count: number) => {
  let result = [];
  for (let i = 0; i < count; i++) {
    result = [...result, ...goodsInitialList];
  }
  return result;
}

export default class GoodsDataSource extends BasicDataSource {
  private dataArray: GoodsListItemType[] = createListRange(2);

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): GoodsListItemType {
    return this.dataArray[index];
  }

  public pushData(data: GoodsListItemType): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}