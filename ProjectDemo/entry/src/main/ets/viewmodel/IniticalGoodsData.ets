/**
 * Author:HouGe
 * Date:2023/10/5
 * Describe:
 */

export const initTabBarData = ['手机', '服饰', '穿搭', '家居']

export interface GoodsListItemType {
  goodsImg: Resource;
  goodsName: string;
  advertising_language: string;
  evaluate: string;
  price: string;
}

export const goodsInitialList: GoodsListItemType[] = [
  {
    goodsImg: $r('app.media.goodsImg'),
    goodsName: '【新品上市】畅乐冰晶绿低脂新品',
    advertising_language: '重磅推荐，MD新品试用中！',
    evaluate: '6662人评价 95%好评',
    price: '¥199'
  },
  {
    goodsImg: $r('app.media.goodsImg_2'),
    goodsName: '【新品上市】畅乐冰晶绿低脂新品',
    advertising_language: '重磅推荐，MD新品试用中！',
    evaluate: '6662人评价 95%好评',
    price: '¥998'
  },
  {
    goodsImg: $r('app.media.goodsImg_3'),
    goodsName: '【新品上市】畅乐冰晶绿低脂新品',
    advertising_language: '重磅推荐，MD新品试用中！',
    evaluate: '6662人评价 95%好评',
    price: '¥99'
  },
  {
    goodsImg: $r('app.media.goodsImg_4'),
    goodsName: '【新品上市】畅乐冰晶绿低脂新品',
    advertising_language: '重磅推荐，MD新品试用中！',
    evaluate: '6662人评价 95%好评',
    price: '¥1999'
  }
]