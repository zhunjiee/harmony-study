/**
 * Author:HouGe
 * Date:2023/9/21
 * Describe:
 */

export default class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];

  // 获取数据总数
  public totalCount(): number {
    return 0;
  }

  // 获取索引值对应的数据
  public getData(index: number): any {
    return undefined;
  }

  // 注册数据改变的监听器
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  // 注销数据改变的监听器
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  /*
    interface DataChangeListener {
      onDataAdd(index: number): void; // 添加数据时调用
      onDataMove(from: number, to: number): void; // 数据移动起始位置与数据移动目标位置交换时调用
      onDataDelete(index: number): void; // 删除数据时调用
      onDataChange(index: number): void; // 改变数据时调用

      onDataReloaded(): void; // 重新加载数据时调用
      onDataAdded(index: number): void; // 添加数据时调用
      onDataMoved(from: number, to: number): void; // 数据移动起始位置与数据移动目标位置交换时调用
      onDataDeleted(index: number): void; // 删除数据时调用
      onDataChanged(index: number): void; // 改变数据时调用
    }
   */

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}